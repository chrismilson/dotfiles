# Colour the shell with solarized dark colours

# Define ANSI Colours
$E = [char]27
$bold = "$E[1m"
$reset = "$E[0m"
$black = "$E[m"
$blue = "$E[m"
$cyan = "$E[m"
$green = "$E[m"
$orange = "$E[m"
$purple = "$E[m"
$red = "$E[m"
$violet = "$E[m"
$white = "$E[m"
$yellow = "$E[m"

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