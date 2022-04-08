# Deploy configuration files

Make sure that you have `GNU Stow` installed to your machine.

```shell
sudo pacman -S --noconfirm stow
```

Execute the following commands to deploy config files to your system :

```shell
# bash 
stow bash -t ~/
# i3 window manager
mkdir -p ~/.config/i3 && stow i3 -t ~/.config/i3
# i3 status bar
mkdir -p ~/.config/i3status && stow i3status -t ~/.config/i3status
# neovim
mkdir -p ~/.config/nvim && stow nvim -t ~/.config/nvim
# alacritty
mkdir -p ~/.config/alacritty && stow alacritty -t ~/.config/alacritty
# tmux
mkdir -p ~/.config/tmux && stow tmux -t ~/.config/tmux
# emacs
mkdir -p ~/.emacs.d && stow emacs -t ~/.emacs.d
```

