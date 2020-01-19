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

# Forcing .Net v2.0.50727 to use TLS 1.2 by default
if ((Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\.NETFramework\v2.0.50727').SchUseStrongCrypto -ne 1) {
    $null = New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\.NETFramework\v2.0.50727' -Name 'SchUseStrongCrypto' -PropertyType DWORD -Value 1
}
if ((Get-ItemProperty -Path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NETFramework\v2.0.50727').SchUseStrongCrypto -ne 1) {
    $null = New-ItemProperty -Path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NETFramework\v2.0.50727' -Name 'SchUseStrongCrypto' -PropertyType DWORD -Value 1
}

# Forcing .Net 4 to use TLS 1.2 by default
if ((Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\.NETFramework\v4.0.30319').SchUseStrongCrypto -ne 1) {
    $null = New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\.NETFramework\v4.0.30319' -Name 'SchUseStrongCrypto' -PropertyType DWORD -Value 1
}
if ((Get-ItemProperty -Path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NETFramework\v4.0.30319').SchUseStrongCrypto -ne 1) {
    $null = New-ItemProperty -Path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NETFramework\v4.0.30319' -Name 'SchUseStrongCrypto' -PropertyType DWORD -Value 1
}

# Disable insecure ciphers
$InsecureCiphers = 'DES 56/56', 'NULL', 'RC2 128/128', 'RC2 40/128', 'RC2 56/128', 'RC4 40/128', 'RC4 56/128', 'RC4 64/128', 'RC4 128/128'
foreach ($Cipher in $InsecureCiphers)
{
    if (-not (Test-Path -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\$Cipher")) {
        $CipherKey = (Get-Item -Path 'HKLM:\').OpenSubKey('SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers', $true).CreateSubKey($Cipher)
        $CipherKey.close()
    }
    if ((Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\$Cipher").Enabled -ne 0) {
        $CipherKey = (Get-Item -Path 'HKLM:\').OpenSubKey("SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\$Cipher", $true)
        $CipherKey.SetValue('Enabled', 0, 'DWord')
        $CipherKey.close()
    }
}

# Enable secure ciphers
$SecureCiphers = 'AES 128/128', 'AES 256/256', 'Triple DES 168/168'
foreach ($Cipher in $SecureCiphers)
{
    if (-not (Test-Path -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\$Cipher")) {
        $CipherKey = (Get-Item -Path 'HKLM:\').OpenSubKey('SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers', $true).CreateSubKey($Cipher)
        $CipherKey.close()
    }
    if ((Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\$Cipher").Enabled -ne 1) {
        $CipherKey = (Get-Item -Path 'HKLM:\').OpenSubKey("SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\$Cipher", $true)
        $CipherKey.SetValue('Enabled', 1, 'DWord')
        $CipherKey.close()
    }
}
