#!/usr/bin/env bash

for f in $(ls -a .); do
  if [ "$f" == "install.sh" ] || [ "$f" == "." ] || [ "$f" == ".." ]; then
    true # Do nothing
  elif [ -d "$f" ]; then
    mkdir -p "$HOME/$f"
  else
    cp "$f" "$HOME/$f"
  fi
done
