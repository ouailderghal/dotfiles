# Deploy config files

Make sure that you have `GNU Stow` installed to your machine.

```shell
sudo apt install -y stow
```

Execute the following commands to deploy config files to your system :

```shell
# i3 window manager
mkdir -p ~/.config/i3 && stow i3 -t ~/.config/i3
```

