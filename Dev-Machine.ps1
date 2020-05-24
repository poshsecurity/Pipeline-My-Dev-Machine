# Install some apps
winget install PowerShell-Preview
winget install Powershell
winget install vscode
winget install SSMS
winget install Wireshark
winget install WinMerge
winget install VLC
winget install adobereader
winget install Git
winget install PowerToys
winget install Discord
winget install Gpg4win
winget install iTunes           # Was using windows store - moving to winget
winget install GitKraken        # Was doing this one manually - moving to winget
winget install FoxitReader      # Use this one for work
winget install Nmap             # How could i have forgotten NMAP!
winget install Keybase          # Was doing this one manually - moving to winget
winget install LastPass         # Was doing this one manually - moving to winget
winget install PowerBI          # Used for work, via store - moving to winget
winget install "Windows Terminal" # Was using windows store - moving to winget
winget install postman          # Was doing this one manually - moving to winget
winget install Slack            # Was using windows store - moving to winget
winget install telegram         # Was using windows store - moving to winget
winget install Fiddler          # Was doing this one manually - moving to winget

# Set UAC to full
if ((Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System').ConsentPromptBehaviorAdmin -ne 2) {
    $null = Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'ConsentPromptBehaviorAdmin' -Value 2
}
