Add-MpPreference -ExclusionPath "C:\ProgramData\mog.communique.player"
Add-MpPreference -ExclusionPath "C:\Users\$($env:USERNAME)\AppData\Local\Communique 7 Player"
(Get-MpPreference).ExclusionPath