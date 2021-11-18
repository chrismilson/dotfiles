# Powershell paths

# Directories to be prepended to the path
$prepend = @()

# Directories to append to the path
$append = @(
    "${HOME}/bin"
    "${HOME}/.dotfiles/bin"
)

# Modify the local path variable first, and then update the environment variable once at the end
$path = $env:PATH

# Prepend directories to path
foreach ($dir in $prepend) {
    if (Test-Path -Path $dir) {
        $path = "${dir};${path}"
    }
}

foreach ($dir in $append) {
    if (Test-Path -Path $dir) {
        $path = "${path};${dir}"
    }
}

# Finally set the environment variable
$env:PATH = $path
