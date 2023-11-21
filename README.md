```
git clone --bare git@github.com:tomferon/dotfiles.git $HOME/dotfiles
alias config='git --git-dir=$HOME/dotfiles --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout
```

The fonts can be installed with `~/utils/fonts/install.sh`. 

# iTerm2

The font can be set to "Fira Code for powerline", Regular (+ enable "Use ligatures") in preferences.

iTerm2's color presets is set to catpuccin by importing `~/utils/catppuccin-iterm/colors/...-frappe...`.
