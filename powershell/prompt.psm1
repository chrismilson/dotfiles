# Colour the shell with solarized dark colours
. "$HOME/.dotfiles/powershell/colours/Set-SolarizedDark.ps1"

# Define ANSI Colours
$E = [char]27
$bold = "$E[1m"
$reset = "$E[0m"
$black = "$E[1;30m"
$blue = "$E[38;2;38;139;210m"
$cyan = "$E[38;2;42;161;152m"
$green = "$E[38;2;133;153;0m"
$orange = "$E[38;2;203;75;22m"
$purple = "$E[38;2;211;54;130m"
$red = "$E[38;2;211;1;2m"
$violet = "$E[38;2;108;113;196m"
$white = "$E[1;37m"
$yellow = "$E[38;2;181;137;0m"

# Define the new prompt
function prompt {
    $PS1 = "`n${bold} "

    if (Test-Path variable:/PSDebugContext) {
        $PS1 += "${red}[DEBUG] "
    }

    $location = Get-Location
    $location = $location -replace "^$([regex]::Escape($HOME))", "~"
    
    $PS1 += "${orange}${env:UserName}"
    $PS1 += "${white} at "
    $PS1 += "${yellow}$(Hostname)"
    $PS1 += "${white} in "
    $PS1 += "${green}${location}"
    $PS1 += "`n${white} "

    if ($NestedPromptLevel -ge 1) {
        $PS1 += ">>>"
    }
    else {
        $PS1 += ">"
    }

    $PS1 += " ${reset}"

    return $PS1
}