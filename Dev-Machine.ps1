
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
choco install fiddler
choco install winmerge
choco install postman
choco install vlc
choco install snagit
choco install camtasia
choco install adobereader
choco install git.install --params "/NoShellIntegration /SChannel"
