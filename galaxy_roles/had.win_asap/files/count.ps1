$RegUninstallPaths = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
$asapPattern = "Vector ASAP2 Tool-Set"
$versions = ""
$count = 0
$UninstallSearchFilter = {($_.GetValue('DisplayName') -like "*$asapPattern*") -And ($_.GetValue('DisplayName') -Match "$versions")}

if (Test-Path $RegUninstallPaths) {
	$count = (Get-ChildItem $RegUninstallPaths | Where-Object $UninstallSearchFilter).count
}

Write-Host $count
