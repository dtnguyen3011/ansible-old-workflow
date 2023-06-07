$KeepJdkVersion = ""
$RegUninstallPaths = @(
    'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall',
    'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall'
)

$UninstallSearchFilter = {(
                            ($_.GetValue('DisplayName') -like '*Java*') -and
                            ($_.GetValue('Publisher') -eq 'Oracle Corporation')
                        ) -or (
                            ($_.GetValue('DisplayName') -like '*JDK*') -and
                            ($_.GetValue('DisplayName') -NotLike "OpenJDK $KeepJdkVersion-redhat")
                        )}
# Uninstall unwanted Java versions and clean up program files
foreach ($Path in $RegUninstallPaths) {
    if (Test-Path $Path) {
        Get-ChildItem $Path | Where-Object $UninstallSearchFilter | 
        foreach {
            Start-Process 'C:\Windows\System32\msiexec.exe' "/X$($_.PSChildName) /qn /norestart" -Wait
        }
    }
}

New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT | Out-Null
$ClassesRootPath = "HKCR:\Installer\Products"
Get-ChildItem $ClassesRootPath | 
    Where-Object {(
                    ($_.GetValue('ProductName') -like '*Java*')
                ) -or (
                    ($_.GetValue('DisplayName') -like '*JDK*') -and
                    ($_.GetValue('DisplayName') -NotLike "OpenJDK $KeepJdkVersion-redhat")
                )} | Foreach {
        Remove-Item $_.PsPath -Force -Recurse
    }

$JavaSoftPath = 'HKLM:\SOFTWARE\JavaSoft'
if (Test-Path $JavaSoftPath) {
    Remove-Item $JavaSoftPath -Force -Recurse
}
