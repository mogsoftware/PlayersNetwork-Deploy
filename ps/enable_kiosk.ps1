# Set your real Tauri path here
$appPath = "C:\Users\MogPlayer\AppData\Local\Communique 7 Player\mogplayer.exe" 

# 1. Force Windows to allow custom per-user shells globally
$winlogonPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
Set-ItemProperty -Path $winlogonPath -Name "Shell" -Value "explorer.exe"

# 2. Target the active user's Windows SID registry shell layout
$userSid = [System.Security.Principal.WindowsIdentity]::GetCurrent().User.Value
$userShellPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\PerUserProfiles\$userSid"

if (-not (Test-Path $userShellPath)) { 
    New-Item -Path $userShellPath -Force 
}
Set-ItemProperty -Path $userShellPath -Name "Shell" -Value $appPath

# 3. Enable the Shell Launcher feature flag so Windows checks PerUserProfiles
$iniPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
if (-not (Test-Path $iniPath)) { New-Item -Path $iniPath -Force }
Set-ItemProperty -Path $iniPath -Name "Shell" -Value $appPath -ErrorAction SilentlyContinue

# Force System Restart
Restart-Computer
