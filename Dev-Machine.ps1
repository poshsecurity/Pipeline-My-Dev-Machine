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

<#

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

# Disable MD5
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\MD5')) {
    $null = New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\MD5' -ItemType Directory
}
if ((Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\MD5').Enabled -ne 0) {
    $null = New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\MD5' -Name 'Enabled' -Value 0
}

# Enable SHA
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\SHA')) {
    $null = New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\SHA' -ItemType Directory
}
if ((Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\SHA').Enabled -ne 1) {
    $null = New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\SHA' -Name 'Enabled' -Value 1
}

# Enable Diffie-Hellman / PKCS
$KeyExchangeAlgorithms = 'Diffie-Hellman', 'PKCS'
foreach ($KeyExchangeAlgorithm in $KeyExchangeAlgorithms)
{
    if (-not (Test-Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\$KeyExchangeAlgorithm")) {
        $null = New-Item "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\$KeyExchangeAlgorithm" -ItemType Directory
    }
    if ((Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\$KeyExchangeAlgorithm").Enabled -ne 1) {
        $null = New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\$KeyExchangeAlgorithm" -Name 'Enabled' -Value 1
    }
}

# Update Cipher Suite Order
$cipherSuitesOrder = @(
    'TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P521',
    'TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384',
    'TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256',
    'TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P521',
    'TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384',
    'TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P256',
    'TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P521',
    'TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA_P521',
    'TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P384',
    'TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256',
    'TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA_P384',
    'TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA_P256',
    'TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384_P521',
    'TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384_P384',
    'TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256_P521',
    'TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256_P384',
    'TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256_P256',
    'TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384_P521',
    'TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384_P384',
    'TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA_P521',
    'TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA_P384',
    'TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA_P256',
    'TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256_P521',
    'TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256_P384',
    'TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256_P256',
    'TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA_P521',
    'TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA_P384',
    'TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA_P256',
    'TLS_DHE_DSS_WITH_AES_256_CBC_SHA256',
    'TLS_DHE_DSS_WITH_AES_256_CBC_SHA',
    'TLS_DHE_DSS_WITH_AES_128_CBC_SHA256',
    'TLS_DHE_DSS_WITH_AES_128_CBC_SHA',
    'TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA'
)
$cipherSuitesAsString = [string]::join(',', $cipherSuitesOrder)
if (-not (Get-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Cryptography\Configuration\SSL\00010002').Functions -eq $cipherSuitesAsString) {
    $null = New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Cryptography\Configuration\SSL\00010002' -Name 'Functions' -Value $cipherSuitesAsString -PropertyType String
}

# Disable PCT 1.0 / SSL 3.0 / SSL 2.0 / TLS 1.0 / TLS 1.1
$sslVersions = 'PCT 1.0', 'SSL 3.0', 'SSL 2.0', 'TLS 1.0', 'TLS 1.1'
foreach ($sslVersion in $sslVersions)
{
    if (-not (Test-Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\$sslVersion")) {
        $null = New-Item "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\$sslVersion" -ItemType Directory
    }
    if (-not (Test-Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\$sslVersion\Server")) {
        $null = New-Item "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\$sslVersion\Server" -ItemType Directory
    }
    if ((Get-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\$sslVersion\Server").Enabled -ne 0) {
        $null = New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\$sslVersion\Server" -Name 'Enabled' -Value 0
    }
    if ((Get-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\$sslVersion\Server").DisabledByDefault -ne 1) {
        $null = New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\$sslVersion\Server" -Name 'DisabledByDefault' -Value 1
    }
}

#>
