# Create a new directory and enter it
function CreateAndSet-Directory([String] $path) {
    New-Item $path -ItemType Directory -ErrorAction SilentlyContinue
    Set-Location $path
}

Set-Alias -Name mkd -Value CreateAndSet-Directory
