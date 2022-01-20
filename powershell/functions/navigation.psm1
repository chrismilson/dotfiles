# Some helpful functions for fast navigation

${function:~} = { Set-Location ~ }
function .. { Set-Location ..  }
${function:...} = { Set-Location ..\.. }
${function:....} = { Set-Location ..\..\.. }
${function:.....} = { Set-Location ..\..\..\.. }
${function:......} = { Set-Location ..\..\..\..\.. }

function swapd {
    # We want to swap between the last recently viewed directory and the current
    # directory.

    # If we just used `Set-Location -`, We would be able to go back, but not
    # forward.

    # Effectively, we want to chenge the order of the two values at the top of
    # the stack

    $current = Get-Location

    Pop-Location

    $past = Get-Location

    Pop-Location

    Push-Location $current
    Push-Location $past
}

function saved {
    Push-Location -Path $location -StackName "saved"
}

function loadd {
    Pop-Location -StackName "saved"
    saved # save the location again for ease of use.
}

function p {
    Push-Location -Path "${HOME}/projects"
}

function t {
    Push-Location -Path "c:/temp"
}
