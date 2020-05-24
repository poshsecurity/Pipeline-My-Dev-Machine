# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Enable Chocolatey features
choco feature enable -n allowGlobalConfirmation

choco install microsoft-monitoring-agent --params="'/WorkspaceId:#{WorkspaceId}# /workspaceKey:#{workspaceKey}#'"
