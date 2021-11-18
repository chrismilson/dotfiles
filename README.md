# Dotfiles

Various configuration files and scripts. It makes me feel more at home.

## Install

To install the dotfiles:

1. Fork the repository to your own github account.
1. Clone your shiny new fork to your own computer.

    ```bash
    $ git clone git@github.com:<your github username>/dotfiles.git
    ```
1. Navigate to the bin folder
    
    ```bash
    $ cd <path to repository>/bin
    ```
1. Run the install script

    ```bash
    $ ./dotfiles
    ```

### Powershell

The install for the powershell dotfiles is much the same, but instead of running `bin/dotfiles`, run `bin/dotfiles.ps1`.

Note that it is highly recommended to change the powershell colour scheme to match the solarized colours that the prompt is expecting. For details about how to do this, see [the powershell solarized repository](https://github.com/neilpa/cmd-colors-solarized).

## Thanks to...

- Mathias Bynens and [his dotfiles](https://github.com/mathiasbynens/dotfiles).
- Janmoesen and [his dotfiles](https://github.com/janmoesen/tilde).
- Nicolas Gallagher and [his dotfiles](https://github.com/necolas/dotfiles).