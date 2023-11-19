```
git clone --bare git@github.com:tomferon/dotfiles.git $HOME/dotfiles
alias config='git --git-dir=$HOME/dotfiles --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout
```

The fonts can be installed with `~/fonts/install.sh`. It can be set to "Fira Code for powerline", Medium (+ enable "Use ligatures") in iTerm2's preferences.

iTerm2's color presets is set to Solarized Dark with a darker background.
