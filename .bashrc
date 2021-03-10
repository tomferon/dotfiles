# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it.
shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make the pattern "**" used in a pathname expansion context match all files and
# zero or more directories and subdirectories.
shopt -s globstar

# Make less more friendly for non-text input files, see lesspipe(1).
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set a fancy prompt (non-color, unless we know we "want" color).
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# Load Nix.
if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
    . "$HOME/.nix-profile/etc/profile.d/nix.sh"

    # Install Starship for prompt.
    if [ ! -x "$(which starship)" ]; then
        nix-env -iA nixpkgs.starship ||
            nix-env -iA nixos.starship ||
            nix profile install nixpkgs#starship ||
            true # Give up if it can't be installed.
    fi
fi

# Set the prompt.
if [ -x "$(which starship)" ]; then
    eval "$(starship init bash)"
elif [ "$color_prompt" = yes ]; then
    PS1='\[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]$?/\j \[\e[1;34m\]\$\[\e[m\]\[\e[0m\] '
else
    PS1='\w $?/\j \$ '
fi
unset color_prompt

# Enable color support of ls and also add handy aliases.
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable programmable completion features.
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi

    if [ -d "$HOME/.nix-profile/share/bash-completion/completions" ]; then
        for f in $(find "$HOME/.nix-profile/share/bash-completion/completions" -type f); do
            . "$f"
        done
    fi
fi

# Only load direnv if the file exists. Don't install in that file in
# devcontainers.
if [ -f ~/.bash_direnv ]; then
    . ~/.bash_direnv
fi

EDITOR=vim
