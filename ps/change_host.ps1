$id = Read-Host "Enter ID (e.g. Bt01)"
if ($id) {
    Rename-Computer -NewName "MogPlayer$id" -Force
    Start-Process -FilePath "C:\Scripts\EnableKiosk.bat" -Verb RunAs
}
