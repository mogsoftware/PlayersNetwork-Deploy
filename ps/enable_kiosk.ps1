# 1. Update the master shell key to point to our launcher
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "Shell" -Value "C:\Scripts\Launcher.bat"

# 2. Write "Active" inside the status file
"Active" | Out-File -FilePath "C:\Scripts\Ps\kiosk_status.txt" -Encoding ascii -Force

# 3. Trigger reboot
Restart-Computer
