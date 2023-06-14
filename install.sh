#!/bin/bash

# Install Oh My Zsh
if [ ! -d "$HOME/.local/share/oh-my-zsh" ];
then
    git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.local/share/oh-my-zsh/"
fi

# Ensure zsh custom is available
THEMES_DIR="$HOME/.local/share/zsh-custom/themes"
PLUGIN_DIR="$HOME/.local/share/zsh-custom/plugins"
mkdir -p "$THEMES_DIR"
mkdir -p "$PLUGIN_DIR"

if [ ! -d "$PLUGIN_DIR/exa" ];
then
    git clone https://github.com/TwoPizza9621536/zsh-exa.git "$PLUGIN_DIR/exa"
fi

if [ ! -d "$PLUGIN_DIR/fast-syntax-highlighting" ];
then
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git "$PLUGIN_DIR/fast-syntax-highlighting"
fi

if [ ! -d "$PLUGIN_DIR/zsh-autosuggestions" ];
then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$PLUGIN_DIR/zsh-autosuggestions"
fi

if [ ! -d "$PLUGIN_DIR/zsh-bat" ];
then
    git clone https://github.com/fdellwing/zsh-bat "$PLUGIN_DIR/zsh-bat"
fi

# Install fzf
if [ ! -d "$HOME/.fzf" ]
then
    git clone https://github.com/junegunn/fzf.git "$HOME/.fzf"
    "$HOME/.fzf/install --bin"
fi

# Install RustUp
curl https://sh.rustup.rs -sSf | sh -s -- -y

source "$HOME/.cargo/env"

cargo install fd-find exa ripgrep bat zoxide

cd "$HOME/dotfiles"

stow shell &> /dev/null
