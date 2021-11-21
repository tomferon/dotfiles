#!/usr/bin/env bash

for f in $(ls -a .); do
  if [ "$f" == "install.sh" ] || [ "$f" == "." ] || [ "$f" == ".." ] ||
     [ "$f" == ".bash_direnv" ] # Don't install direnv in devcontainers.
  then
    true # Do nothing
  elif [ -d "$f" ]; then
    mkdir -p "$HOME/$f"
  else
    cp -r "$f" "$HOME/$f"
  fi
done
