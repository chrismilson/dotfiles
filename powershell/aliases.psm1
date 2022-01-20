# Make on-the-fly setting of new aliases easier
Set-Alias -Name sa -Value Set-Alias

# Git shortening makes the world happier
Set-Alias -Name g -Value git

# Clipboard aliases
Set-Alias -Name pbcopy -Value Set-Clipboard
Set-Alias -Name pbpaste -Value Get-Clipboard

# Missing Bash Alias
Set-Alias -Name time -Value Measure-Command

# Use ls.exe if available
if (Get-Command ls.exe -ErrorAction SilentlyContinue | Test-Path) {
    rm alias:ls -ErrorAction SilentlyContinue

    ${function:ls} = { ls.exe --color @args }
    ${function:ll} = { ls -lF @args }
    ${function:la} = { ls -laF @args }
} else {
    ${function:ls} = { ls -Force @args }
}

# Determin size of a file or total size of a directory
Set-Alias -Name fs -Value Get-DiskUsage

# Similar to ? and %
Set-Alias -Name : -Value Select-Object
