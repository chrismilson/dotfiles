# Make tab completion more like bash
Set-PSReadLineKeyHandler -Key Tab -Function Complete

# Search history based on the currently typed text
Set-PSReadLineKeyHandler -Chord UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Chord DownArrow -Function HistorySearchForward
