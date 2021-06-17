# if($(Get-WindowsCapability -Name "Rsat.CertificateServices.Tools*" -Online).State -eq 'NotPresent') {
#     # Note: try this if there are errors on installation https://www.wincert.net/microsoft-windows/windows-10/cannot-install-rsat-tools-on-windows-10-1809-error0x80244022/
#     Write-Warning "Please install RSAT tools with 'Get-WindowsCapability -Name `"Rsat*`" -Online | Add-WindowsCapability -Online'"
#     exit(1)
# }

try {
    Import-Module PSPKI -Force -ErrorAction Stop
}
catch {
    Write-Warning "Please install PSPKI with '[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Install-Module PSPKI'"
    exit(1)
}

try {
    Import-Module ActiveDirectory -Force -ErrorAction Stop
}
catch {
    Write-Warning "Please install the ActiveDirectory module'"
    exit(1)
}

Get-ChildItem -Path $PSScriptRoot -Recurse -Include *.ps1 | % { Import-Module $_.FullName -DisableNameChecking -Force }