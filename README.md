```
git clone --bare git@github.com:tomferon/dotfiles.git $HOME/dotfiles
alias config='git --git-dir=$HOME/dotfiles --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout
```
