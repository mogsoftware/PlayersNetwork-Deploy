# 1. Update the master shell key to target our custom launch pipeline
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "Shell" -Value "C:\Scripts\Launcher.bat"

# 2. Assign the explicit system registry tracking key to 1 (Enabled)
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "KioskMode" -Value 1 -Type DWord -Force

# 3. Request computer restart
Restart-Computer
