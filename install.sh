#!/bin/bash
command -v stow &> /dev/null && stow . -t ~ --dotfiles ||  echo "[ERR] stow is not installed"
