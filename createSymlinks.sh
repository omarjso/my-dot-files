#!/bin/bash
set -e

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
mkdir -p "$XDG_CONFIG_HOME"

ln -sf "$HOME/dot_files/nvim" "$XDG_CONFIG_HOME/nvim"
ln -sf "$HOME/dot_files/.zshrc" "$HOME/.zshrc"
ln -sf "$HOME/dot_files/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$HOME/dot_files/.gitconfig" "$HOME/.gitconfig"

if [ -n "$SIOYEK_CONFIG_DIR" ]; then
    mkdir -p "$SIOYEK_CONFIG_DIR"
    for file in "$HOME/dot_files/sioyek.app"/*.config; do
        ln -sf "$file" "$SIOYEK_CONFIG_DIR/"
    done
fi
