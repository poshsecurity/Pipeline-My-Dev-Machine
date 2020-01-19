
# Install Chocolatey

Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Enable Chocolatey features
choco feature enable -n allowGlobalConfirmation

# Install some apps
choco install kb2999226
choco install powershell-preview
choco install vscode.install
choco install rsat
