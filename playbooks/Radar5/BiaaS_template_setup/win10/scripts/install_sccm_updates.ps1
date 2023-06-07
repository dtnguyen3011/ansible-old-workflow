$wmiCCMSDK = "root\CCM\ClientSDK"
$sendMailParams = @{
    From = 'SystemUser@bosch.com'
    To = 'xcdaradarcontinuousx@bosch.com'
    Subject = '[ERROR] SCCM Updates failed'
    Body = ''
    SMTPServer = 'rb-smtp-int.bosch.com'
}

$updateStates = @{
    0='No state information is available.'
    1='Application is enforced to desired/resolved state.';
    2='Application is not required on the client.';
    3='Application is available for enforcement (install or uninstall based on resolved state). Content may/may not have been downloaded.';
    4='Application last failed to enforce (install/uninstall).';
    5='Application is currently waiting for content download to complete.';
    6='Application is currently waiting for content download to complete.';
    7='Application is currently waiting for its dependencies to download.';
    8='Application is currently waiting for a service (maintenance) window.';
    9='Application is currently waiting for a previously pending reboot.';
    10='Application is currently waiting for serialized enforcement.';
    11='Application is currently enforcing dependencies.';
    12='Application is currently enforcing.';
    13='Application install/uninstall enforced and soft reboot is pending.';
    14='Application installed/uninstalled and hard reboot is pending.';
    15='Update is available but pending installation.';
    16='Application failed to evaluate.';
    17='Application is currently waiting for an active user session to enforce.';
    18='Application is currently waiting for all users to logoff.';
    19='Application is currently waiting for a user logon.';
    20='Application in progress, waiting for retry.';
    21='Application is waiting for presentation mode to be switched off.';
    22='Application is pre-downloading content (downloading outside of install job).';
    23='Application is pre-downloading dependent content (downloading outside of install job).';
    24='Application download failed (downloading during install job).';
    25='Application pre-downloading failed (downloading outside of install job).';
    26='Download success (downloading during install job).';
    27='Post-enforce evaluation.';
    28='Waiting for network connectivity.';
}
$finishStates = @(8, 9, 10, 12, 13, 19)
$failedStates = @(3, 4, 16, 17, 18, 20, 21, 24, 25, 28)


function Get-CCMAppUpdates {
    try{
        $appUpdates = Get-WmiObject -Namespace $wmiCCMSDK -Class CCM_Application -ErrorAction Stop | Where-Object {$_.EvaluationState -GT 2}
        if (($appUpdates | Measure-Object).Count -eq 0) {
            Write-Host " > No app updates pending < " -ForegroundColor Green
        }
        return $appUpdates
    }
    catch {
        Write-Host " > Failed to get list of app updates < " -ForegroundColor Red
        $sendMailParams.Body = $sendMailParams.Body + "Failed to get list of app updates on instance $(hostname). Please, check it manually.`r`n"
    }
}

function Install-CCMAppUpdates {
    [cmdletbinding()]
    param (
        $UpdateApps
    )
    $UpdateApps | ForEach-Object {
        ([WmiClass]'Root\CCM\ClientSDK:CCM_Application').Install($_.Id, $_.Revision, $_.IsMachineTarget, 0, "Normal", $false)
    }
}

function Wait-ForCCMAppUpdatesToFinish {
    do {
        $updates = Get-WmiObject -Class CCM_Application -Namespace $wmiCCMSDK -ErrorAction Stop | Where-Object { $_.EvaluationState -GE 4}
        $updates | Foreach-Object {
            Write-Progress -Activity $_.Name -PercentComplete $_.PercentComplete
            Start-Sleep -Seconds 1
        }
        Start-Sleep -Seconds 1
        Write-Host "[$($updates.PercentComplete)]% - EvaluationState [$($updates.EvaluationState)]"
        $stateFinished = $true
        foreach ($state in $updates.EvaluationState) {
            do {
                $innerUpdates = Get-WmiObject -Class CCM_Application -Namespace $wmiCCMSDK | Where-Object { $_.EvaluationState -GE 4}
                Start-Sleep -Seconds 5
                Write-Host "[$($innerUpdates.PercentComplete)]% - EvaluationState [$($innerUpdates.EvaluationState)]"
                if (-Not ($innerUpdates.EvaluationState -contains 12)) {
                    break;
                }
            } while ($state -eq 12)
            if (-Not ($finishStates -contains $state)) {
                $stateFinished = $false
                break;
            }
        }
    } while (($updates.PercentComplete -ne 100) -And (-Not $stateFinished))
    $updates = Get-WmiObject -Class CCM_Application -Namespace $wmiCCMSDK | Where-Object {$_.EvaluationState -GT 2}
    $updates | Foreach-Object {
        $updateName = $_.Name
        $updateState = [int]$_.EvaluationState
        if ($failedStates -contains $_.EvaluationState) {
            Write-Host " > Failed to install app update $updateName - $($updateStates.$updateState) < " -ForegroundColor Red
            $sendMailParams.Body = $sendMailParams.Body + "Failed to install app update $updateName on instance $(hostname) - $($updateStates.$updateState). Please, check it manually.`r`n"
        }
    }
}

function Get-CCMUpdates {
    try{
        $sysUpdates = Get-WmiObject -Namespace $wmiCCMSDK -Class CCM_SoftwareUpdate -Filter ComplianceState=0 -ErrorAction Stop
        if (($sysUpdates | Measure-Object).Count -eq 0) {
            Write-Host " > No system updates pending < " -ForegroundColor Green
        }
        return $sysUpdates
    }
    catch {
        Write-Host " > Failed to get list of system updates < " -ForegroundColor Red
        $sendMailParams.Body = $sendMailParams.Body + "Failed to get list of system updates on instance $(hostname). Please, check it manually.`r`n"
    }
}

function Install-CCMUpdates {
    [cmdletbinding()]
    param (
        $UpdateElements
    )
    $UpdatesReformatted = @($UpdateElements | ForEach-Object {
        if ($_.ComplianceState -eq 0) {[WMI]$_.__PATH}
    })
    Invoke-WmiMethod -Class CCM_SoftwareUpdatesManager -Name InstallUpdates -ArgumentList (, $UpdatesReformatted) -Namespace $wmiCCMSDK
}

function Wait-ForCCMUpdatesToFinish {
    do {
        $updates = Get-WmiObject -Class CCM_SoftwareUpdate -Namespace $wmiCCMSDK -Filter ComplianceState=0
        $updates | Foreach-Object {
            Write-Progress -Activity $_.Name -PercentComplete $_.PercentComplete
            Start-Sleep -Seconds 1
        }
        Start-Sleep -Seconds 1
        Write-Host "[$($updates.PercentComplete)]% - EvaluationState [$($updates.EvaluationState)]"
        $stateFinished = $true
        foreach ($state in $updates.EvaluationState) {
            do {
                $innerUpdates = Get-WmiObject -Class CCM_SoftwareUpdate -Namespace $wmiCCMSDK -Filter ComplianceState=0
                Start-Sleep -Seconds 5
                Write-Host "[$($innerUpdates.PercentComplete)]% - EvaluationState [$($innerUpdates.EvaluationState)]"
                if (-Not ($innerUpdates.EvaluationState -contains 12)) {
                    break;
                }
            } while ($state -eq 12)
            if (-Not ($finishStates -contains $state)) {
                $stateFinished = $false
                break;
            }
        }
    } while (($updates.PercentComplete -ne 100) -And (-Not $stateFinished))
    $updates = Get-WmiObject -Namespace $wmiCCMSDK -Class CCM_SoftwareUpdate -Filter ComplianceState=0
    $updates | Foreach-Object {
        $updateName = $_.Name
        $updateState = [int]$_.EvaluationState
        if ($failedStates -contains $_.EvaluationState) {
            Write-Host " > Failed to install system update $updateName - $($updateStates.$updateState) < " -ForegroundColor Red
            $sendMailParams.Body = $sendMailParams.Body + "Failed to install system update $updateName on instance $(hostname) - $($updateStates.$updateState). Please, check it manually.`r`n"
        }
    }
}

$appUpdates = Get-CCMAppUpdates
$updateProps = @{
    AllAppUpdates = ($appUpdates | Measure-Object).Count
    PendingAppUpdates = ($appUpdates | Where-Object { $appUpdates.EvaluationState -lt 8 } | Measure-Object).Count
}

if ($updateProps.PendingAppUpdates -gt 0) {
    try {
        Write-Host "AllAppUpdates    : $($updateProps.AllAppUpdates)"
        $appUpdates | ForEach-Object {
            Write-Host $_.Name $_.EvaluationState
        }
        Write-Host "PendingAppUpdates: $($updateProps.PendingAppUpdates)"
        Install-CCMAppUpdates -UpdateApps $appUpdates
        Wait-ForCCMAppUpdatesToFinish
    }
    catch {
        Write-Host " > Failed to install app updates < " -ForegroundColor Red
        $sendMailParams.Body = $sendMailParams.Body + "Failed to install app updates on instance $(hostname). Please, check it manually.`r`n"
    }
}

$appRebootPending = ($appUpdates | Where-Object { $appUpdates.EvaluationState -eq 8 -or $appUpdates.EvaluationState -eq 14 } | Measure-Object).Count
if ($appRebootPending -gt 0) {
    Write-Host "AppRebootPending : $appRebootPending"
}

$sysUpdates = Get-CCMUpdates
$updateProps = @{
    AllUpdates = ($sysUpdates | Measure-Object).Count
    PendingPatches  = ($sysUpdates | Where-Object { $sysUpdates.EvaluationState -ne 8 } | Measure-Object).Count
}
Write-Host " AllSysUpdates: $($updateProps.AllUpdates) "
$sysUpdates | ForEach-Object {
    Write-Host $_.Name $_.EvaluationState
}
Write-Host "PendingPatches: $($updateProps.PendingPatches) "

if ($updateProps.PendingPatches -gt 0) {
    try {
        Install-CCMUpdates -UpdateElements $sysUpdates
        Wait-ForCCMUpdatesToFinish
    }
    catch {
        Write-Host " > Failed to install system updates < " -ForegroundColor Red
        $sendMailParams.Body = $sendMailParams.Body + "Failed to install system updates on instance $(hostname). Please, check it manually.`r`n"
    }
}

if ($sendMailParams.Body -ne '') {
    Send-MailMessage @sendMailParams
}

$sysRebootPending = ($sysUpdates | Where-Object { $sysUpdates.EvaluationState -eq 8 -or $sysUpdates.EvaluationState -eq 14 } | Measure-Object).Count
if ($sysRebootPending -gt 0) {
    Write-Host "SysRebootPending : $sysRebootPending"
}
