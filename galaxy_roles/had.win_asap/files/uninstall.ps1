$RegUninstallPaths = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
$asapPattern = "Vector ASAP2 Tool-Set"
$versions = "None"
If (($args[0] -ne $null) -And ($args[0] -ne "")) {
	$versions = $args[0]
}

$UninstallSearchFilter = {($_.GetValue('DisplayName') -like "*$asapPattern*") -And ($_.GetValue('DisplayName') -Match "$versions")}

# Uninstall unwanted versions and clean up program files
if (Test-Path $RegUninstallPaths) {
    Get-ChildItem $RegUninstallPaths | Where-Object $UninstallSearchFilter | 
    Foreach {
        $InstallDir = $_.GetValue('InstallLocation')
        Start-Process 'C:\Windows\System32\msiexec.exe' "/X$($_.PSChildName) /qn" -Wait
        Remove-Item -Path $InstallDir -Force -Recurse -ErrorAction SilentlyContinue
    }
}

New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT | Out-Null
$ClassesRootPath = "HKCR:\Installer\Products"
Get-ChildItem $ClassesRootPath | Where-Object {($_.GetValue('ProductName') -like "*$asapPattern*") -And ($_.GetValue('ProductName') -Match "$versions")} |
Foreach {
	Remove-Item $_.PsPath -Force -Recurse -ErrorAction SilentlyContinue
}
