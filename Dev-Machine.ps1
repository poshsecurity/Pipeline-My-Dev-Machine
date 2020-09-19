winget install Microsoft.PowerShell-Preview -e
winget install Microsoft.PowerShell -e 
winget install Microsoft.VisualStudioCode -e
winget install Microsoft.VisualStudioCodeInsiders -e
winget install Microsoft.SQLServerManagementStudio -e
winget install WiresharkFoundation.Wireshark -e
winget install WinMerge.WinMerge -e
winget install VideoLAN.VLC -e
winget install Adobe.AdobeAcrobatReaderDC -e
winget install Git.Git -e
winget install 7zip.7zip -e
winget install Microsoft.PowerToys -e
winget install Discord.Discord -e
winget install GnuPG.GnuPG -e
winget install Axosoft.GitKraken -e
winget install Insecure.Nmap -e
winget install Keybase.Keybase -e
winget install Postman.Postman -e
winget install Telerik.FiddlerEverywhere -e
winget install WinDirStat.WinDirStat -e
winget install TeamViewer.TeamViewer -e
winget install RescueTime.RescueTime -e

# Set UAC to full
if ((Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System').ConsentPromptBehaviorAdmin -ne 2) {
    $null = Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'ConsentPromptBehaviorAdmin' -Value 2
}
