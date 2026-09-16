# 1. Flip the registry tracking key back down to 0 (Disabled)
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "KioskMode" -Value 0 -Type DWord -Force

# 2. Safely restore default shell parameters
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "Shell" -Value "explorer.exe" -Force

# 3. Trigger immediate maintenance reboot
Restart-Computer
