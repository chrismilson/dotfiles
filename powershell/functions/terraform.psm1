# Terraform version management
# Expects the following variables to be set
# $env:TERRAFORM_BIN_DIR - the root directory containing the /bin and /versions directories
# Also expects the $env:TERRAFORM_BIN_DIR/bin directory to already be in the $env:PATH

function _complete_available_versions {
    param ($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)

    $versions = Get-ChildItem -directory $env:TERRAFORM_BIN_DIR/versions | Select-Object { $_.Name }
    $versions | Where-Object { $_ -match $wordToComplete }
}

function Set-TerraformVersion {
    param(
        [Parameter(Mandatory=$true)]
        [ArgumentCompleter({ _complete_available_versions @args })]
        $Version
    )

    New-Item `
        -Type SymbolicLink `
        -Path "$env:TERRAFORM_BIN_DIR/bin/terraform.exe" `
        -Target "$env:TERRAFORM_BIN_DIR/versions/$Version/terraform.exe" `
        -Force `
    | Out-Null
}
