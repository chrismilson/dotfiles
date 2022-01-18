# The base script that will load all of the other scripts.

$files = @(
    "$HOME/.dotfiles/powershell/aliases.psm1"
    "$HOME/.dotfiles/powershell/prompt.psm1"
    "$HOME/.dotfiles/powershell/options.psm1"
    "$HOME/.dotfiles/powershell/path.psm1"
    "$HOME/.dotfiles/local/powershell/profile.ps1"
)

$globs = @(
    "$HOME/.dotfiles/powershell/functions/*.psm1"
)

foreach ($file in $files) {
    if (-Not (Test-Path -Path $file)) {
        continue
    }

    Import-Module $file
}

foreach ($glob in $globs) {
    $files = (Get-ChildItem $glob | Select-Object -Expand FullName)

    foreach ($file in $files) {
        Import-Module $file
    }
}
