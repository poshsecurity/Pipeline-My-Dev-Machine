# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Enable Chocolatey features
choco feature enable -n allowGlobalConfirmation

choco install wsl
choco install wsl-alpine
choco install wsl-ubuntu-1804
choco install wsl-opensuse
choco install wsl-sles
choco install wsl-debiangnulinux
choco install wsl-kalilinux
choco install wsl-ubuntu-1604
choco install wsl-ubuntu-2004
