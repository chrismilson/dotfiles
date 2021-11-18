function Edit-Item {
    param(
        [string]
        $Path
    )

    if ($env:DEFAULT_EDITOR -eq $null) {
        Write-Error '$env:DEFAULT_EDITOR is not set'
        return
    }

    $env:DEFAULT_EDITOR
}
