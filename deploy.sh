#!/bin/sh

# The core idea of .files repository is to store all basic configs in one single place.
# Because of that, all real configs will be stored here, and configs used by programs are
# just a symlinks. This script creates these symlinks.

HM="$HOME"
DOTFILES="$HM"/.files

# Bash
rm -f "$HM"/.bashrc
ln -s "$DOTFILES"/.bashrc "$HM"/.bashrc

# NeoVim
rm -rf "$HM"/.config/nvim/init.vim

# Vifm


# Tmux


