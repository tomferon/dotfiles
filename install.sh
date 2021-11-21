#!/usr/bin/env bash

rm -rf "$HOME/.oh-my-zsh"

git submodule init
git submodule update

for f in $(ls -a .); do
  if [ "$f" == "install.sh" ] || [ "$f" == "." ] || [ "$f" == ".." ] ||
     [ "$f" == ".bash_direnv" ] # Don't install direnv in devcontainers.
  then
    true # Do nothing
  elif [ -d "$f" ]; then
    rsync -a "$f/" "$HOME/$f"
  else
    rsync "$f" "$HOME/$f"
  fi
done
