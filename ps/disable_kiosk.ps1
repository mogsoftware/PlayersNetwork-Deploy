$userSid = [System.Security.Principal.WindowsIdentity]::GetCurrent().User.Value
$userShellPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\PerUserProfiles\$userSid"

if (Test-Path $userShellPath) { 
    Remove-Item -Path $userShellPath -Recurse -Force 
}
Restart-Computer
