#!/bin/bash
#
# Linker Script (create symlinks for dotfiles)
#
# Author : Ouail Derghal
# Email  :  <ouailderghal1@gmail.com>
#
#
# Deploy configuration files present in this repo
# to your local machine. This script has been tested
# on Debian 12 BookWarm. It should work on other GNU/Linux
# distributions as well. 
#
# Please make sure that you have `stow` installed.
# Run: `sudo apt install stow` if you are on Debian.
#


HOME_DIR="$HOME"
CONFIG_DIR="$HOME_DIR/.config"
DOTFILES_DIR="$HOME_DIR/Projects/dotfiles"

declare -A config=( 
	[alacritty]="$CONFIG_DIR/alacritty"
	[i3]="$CONFIG_DIR/i3" 
	[i3status]="$CONFIG_DIR/i3stauts" 
	[neofetch]="$CONFIG_DIR/neofetch" 
	[nvim]="$CONFIG_DIR/nvim" 
	[tmux]="$HOME_DIR"
	[xmodmap]="$HOME_DIR"
	[zsh]="$HOME_DIR"
	[git]="$HOME_DIR"
)

help() {
    echo "Usage: linker.sh [COMMAND] [CONFIGURATION]"
    echo ""
    echo "Commands:"
    echo "  apply           Apply a configuration"
    echo "  unapply         Unapply a configuration"
    echo "  help            Show this help message"
    echo ""
    echo "Example:"
    echo "  linker.sh apply i3"
    echo "  linker.sh unapply tmux"
    echo ""
}


apply() {
	[[ ! -x "$(command -v stow )" ]] && echo "ERROR: stow is not installed." && exit 1
	[[ ! -d "$DOTFILES_DIR" ]] && echo "ERROR: dotfiles directory does not exist." && exit 1
	[[ ! -v config[$1] ]] && echo "ERROR: no mapping for $1 configuration." && exit 1

	mkdir -p "${config[$1]}"
	stow --dotfiles --dir "$DOTFILES_DIR" "$1" --target "${config[$1]}" && echo "Success: configuration for $1 has been linked successfuly."
}

unapply() {
	[[ ! -d "$HOME_DIR" ]] && echo "ERROR: home directory does not exist." && exit 1
	[[ ! -d "$CONFIG_DIR" ]] && echo "ERROR: configuration directory does not exist." && exit 1
	[[ ! -v config[$1] ]] && echo "ERROR: no mapping for $1 configuration." && exit 1

	rm -rf "${config[$1]}" && echo "SUCCESS: configuration for $1 has been unlinked successfuly."
}

option="${1}"

case "${option}" in
	-a | --apply) apply "$2"
	;;
	-u | --unapply) unapply "$2"
	;;
	*) help
	;;
esac

