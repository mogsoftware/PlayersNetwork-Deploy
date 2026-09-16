# 1. Write "Inactive" inside the status file
"Inactive" | Out-File -FilePath "C:\Scripts\Ps\kiosk_status.txt" -Encoding ascii -Force

# 2. Trigger reboot to return back to normal desktop mode
Restart-Computer
