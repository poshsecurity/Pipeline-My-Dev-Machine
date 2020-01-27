# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Enable Chocolatey features
choco feature enable -n allowGlobalConfirmation

# Upgrade any existing apps
choco upgrade all

# Install some apps
choco install kb2999226
choco install powershell-core
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
choco install discord.install
choco install gpg4win
choco install vcredist-all

# Set UAC to full
if ((Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System').ConsentPromptBehaviorAdmin -ne 2) {
    $null = Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'ConsentPromptBehaviorAdmin' -Value 2
}

# Mitigation for CVE-2020-0674
takeown /f %windir%\syswow64\jscript.dll
cacls %windir%\syswow64\jscript.dll /E /P everyone:N
takeown /f %windir%\system32\jscript.dll
cacls %windir%\system32\jscript.dll /E /P everyone:N
