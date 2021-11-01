# Install dotfiles for powershell

# Copy git config
# Git will append to this on any calls to `git config --global ...`, and we
# don't want to affect the repo.
Copy-Item -Path "$HOME/.dotfiles/git/gitconfig" -Destination "$HOME/.gitconfig" -Force

# Link the profile to AllUsersAllHosts
New-Item -Type HardLink -Path $profile.AllUsersAllHosts -Target "$HOME/.dotfiles/powershell/profile.ps1" -Force
