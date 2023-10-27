winget install Microsoft.Office -e
winget install Microsoft.PowerShell.Preview -e
winget install Microsoft.PowerShell -e
winget install 7zip.7zip -e
winget install Adobe.Acrobat.Reader.64-bit -e
winget install Axosoft.GitKraken -e
winget install Bitwarden.Bitwarden -e
winget install Dell.DisplayManager -e
winget install Discord.Discord -e
winget install Elgato.StreamDeck -e
winget install Git.Git -e
winget install GnuPG.GnuPG -e # or GnuPG.Gpg4win
winget install Insecure.Nmap -e
winget install Keybase.Keybase -e
winget install Microsoft.PowerToys -e
winget install Microsoft.RemoteDesktopClient -e
winget install Microsoft.SQLServerManagementStudio -e
winget install Microsoft.VisualStudioCode -e
winget install Microsoft.VisualStudioCode.Insiders -e
winget install Microsoft.WindowsTerminal.Preview -e
winget install NZXT.CAM -e
winget install RaspberryPiFoundation.RaspberryPiImager -e
winget install Surfshark.Surfshark -e
winget install tailscale.tailscale -e
winget install TechSmith.Camtasia -e
winget install TechSmith.Snagit.2024 -e
winget install VideoLAN.VLC -e
winget install WinDirStat.WinDirStat -e
winget install WinMerge.WinMerge -e
winget install WinSCP.WinSCP -e
winget install WiresharkFoundation.Wireshark -e
winget install Zoom.Zoom -e

# Set UAC to full
if ((Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System').ConsentPromptBehaviorAdmin -ne 2) {
    $null = Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'ConsentPromptBehaviorAdmin' -Value 2
}
