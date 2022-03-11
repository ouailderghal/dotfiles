# Deploy config files

Make sure that you have `GNU Stow` installed to your machine.

```shell
sudo apt install -y stow
```

Execute the following commands to deploy config files to your system :

```shell
# bash 
stow bash -t ~

# i3 window manager
mkdir -p ~/.config/i3 && stow i3 -t ~/.config/i3

# i3 status bar
mkdir -p ~/.config/i3status && stow i3status -t ~/.config/i3status

# neovim
mkdir -p ~/.config/nvim && stow nvim -t ~/.config/nvim
```

