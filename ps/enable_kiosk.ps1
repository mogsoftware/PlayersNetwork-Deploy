# Set your real Tauri path here
$appPath = "C:\Users\MogPlayer\AppData\Local\Communique 7 Player\mogplayer.exe" 

# Target the active user's Windows SID registry shell layout
$userSid = [System.Security.Principal.WindowsIdentity]::GetCurrent().User.Value
$userShellPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\PerUserProfiles\$userSid"

if (-not (Test-Path $userShellPath)) { 
    New-Item -Path $userShellPath -Force 
}
Set-ItemProperty -Path $userShellPath -Name "Shell" -Value $appPath
Restart-Computer
