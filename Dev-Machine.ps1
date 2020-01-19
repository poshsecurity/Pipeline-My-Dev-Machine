# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Enable Chocolatey features
choco feature enable -n allowGlobalConfirmation

# Upgrade any existing apps
choco upgrade all

# Install some apps
choco install kb2999226
choco install powershell-preview
choco install vscode.install
choco install glasswire
choco install rsat
choco install sql-server-management-studio
choco install wireshark
choco install winmerge
choco install vlc
choco install snagit
choco install camtasia
choco install adobereader
choco install git.install --params "/NoShellIntegration /SChannel"
choco install 7zip.install
choco install powertoys
choco install keybase

# Set UAC to full
if ((Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System').ConsentPromptBehaviorAdmin -ne 2) {
    $null = Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'ConsentPromptBehaviorAdmin' -Value 2
}

# Forcing .Net 4 to use TLS 1.2 by default
if ((Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\.NETFramework\v4.0.30319').SchUseStrongCrypto -ne 1) {
    $null = New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\.NETFramework\v4.0.30319' -Name 'SchUseStrongCrypto' -PropertyType DWORD -Value 1
}
if ((Get-ItemProperty -Path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NETFramework\v4.0.30319').SchUseStrongCrypto -ne 1) {
    $null = New-ItemProperty -Path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NETFramework\v4.0.30319' -Name 'SchUseStrongCrypto' -PropertyType DWORD -Value 1
}

