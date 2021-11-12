function mkd {
    param([string]$Name)
    New-Item -Type Directory -Name $Name
    Set-Location -Path $Name
}