# Host Foreground
$Host.PrivateData.ErrorForegroundColor = 'Red'
$Host.PrivateData.WarningForegroundColor = 'Yellow'
$Host.PrivateData.DebugForegroundColor = 'Green'
$Host.PrivateData.VerboseForegroundColor = 'Blue'
$Host.PrivateData.ProgressForegroundColor = 'Gray'

# Host Background
$Host.PrivateData.ProgressBackgroundColor = 'Cyan'

# Check for PSReadline
if (Get-Module -ListAvailable -Name "PSReadline") {
    $options = Get-PSReadlineOption

    $options.CommandColor = 'Yellow'
    $options.ContinuationPromptColor = 'DarkBlue'
    $options.DefaultTokenColor = 'DarkBlue'
    $options.EmphasisColor = 'Cyan'
    $options.ErrorColor = 'Red'
    $options.KeywordColor = 'Green'
    $options.MemberColor = 'DarkGreen'
    $options.NumberColor = 'DarkGreen'
    $options.OperatorColor = 'DarkCyan'
    $options.ParameterColor = 'DarkCyan'
    $options.StringColor = 'Blue'
    $options.TypeColor = 'DarkBlue'
    $options.VariableColor = 'Green'
}
