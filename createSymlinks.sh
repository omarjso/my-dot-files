#!/bin/bash
ln -sf ~/dot_files/nvim ~/.config/
ln -sf ~/dot_files/.zshrc ~/.zshrc
ln -sf ~/dot_files/.tmux.conf ~/.tmux.conf
ln -sf ~/dot_files/.gitconfig ~/.gitconfig
for file in ~/dot_files/sioyek.app/*.config; do
    ln -sf "$file" ~/Library/Application\ Support/sioyek/
done
