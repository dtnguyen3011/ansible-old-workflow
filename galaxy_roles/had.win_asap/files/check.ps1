$RegUninstallPaths = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
$asapPattern = "Vector ASAP2 Tool-Set"
$versions = ""
$location = ""
If (($args[0] -ne $null) -And ($args[0] -ne "")) {
    $versions = $args[0]
    If (($args[1] -ne $null) -And ($args[1] -ne "")) {
        $location = $args[1]
    }
}

$UninstallSearchFilter = {($_.GetValue('DisplayName') -like "*$asapPattern*") -And ($_.GetValue('DisplayName') -Match "$versions") -And ($_.GetValue('InstallLocation') -Match "$location")}

if (Test-Path $RegUninstallPaths) {
    Get-ChildItem $RegUninstallPaths | Where-Object $UninstallSearchFilter | 
    Foreach {
        Write-Host $_.GetValue('DisplayName')
        Write-Host $_.GetValue('InstallLocation')
    }
}
