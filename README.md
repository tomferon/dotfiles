```
git clone --bare git@github.com:tomferon/dotfiles.git $HOME/dotfiles
alias config='git --git-dir=$HOME/dotfiles --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout
```

The fonts can be installed from `~/utils/FiraCode`. 

# iTerm2

The font can be set to "Fira Code Nerd Font", Regular (+ enable "Use ligatures") in preferences.

iTerm2's color presets is set to catpuccin by importing `~/utils/catppuccin-iterm/colors/...-frappe...`.

In Profiles > Keys > General, Left Option Key should be set to Esc+, otherwise M-1 sends ¡, M-2 ™, etc.

# Nix packages

* bat
* btop
* cmake
* delta
* direnv
* fd
* fzf
* neovim
* ripgrep
* tmux
