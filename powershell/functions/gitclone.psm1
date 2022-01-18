# Clones a repository and then goes into said repository
function gitclone {
    param($1, $2)
    
    if (-Not $1) {
        $1 = Get-Clipboard
    }

    if (-Not $2) {
        $2 = [io.path]::GetFileNameWithoutExtension($1)
    }
    
    git clone $1 $2
    Set-Location $2
}

