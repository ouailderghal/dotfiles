#!/bin/bash

STOW_SRC="."
STOW_TARGET="$HOME"

command -v stow &> /dev/null || (echo "[ERR] stow is not installed" && exit 1)
stow $STOW_SRC -t $STOW_TARGET --dotfiles --verbose
