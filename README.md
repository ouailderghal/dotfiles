# Dotfiles

Configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/)
(requires Stow `2.4.0+`).

## Usage

Run from the root of this repo:

```bash
stow . -t "$HOME" --dotfiles --adopt
```

Dry run (simulate without touching the filesystem):

```bash
stow -n -v . -t "$HOME" --dotfiles --adopt
```

Ignored files and packages are configured in `.stowrc`.

## Available Configurations

- **alacritty**: Alacritty terminal
- **bash**: Bash shell configuration
- **bash-completion**: Bash completion scripts
- **emacs**: Emacs editor
- **git**: Git configuration
- **hypr**: Hyprland window manager
- **i3**: i3 window manager
- **i3status**: Status bar for i3
- **ideavim**: JetBrains IdeaVim plugin
- **kitty**: Kitty terminal
- **lf**: lf terminal file manager
- **mpd**: Music Player Daemon
- **ncmpcpp**: MPD client
- **papis**: Papis document manager
- **sway**: Sway window manager
- **terminator**: Terminator terminal
- **tmux**: Terminal multiplexer
- **vim**: Vim editor
- **waybar**: Status bar for Wayland
- **xmodmaprc**: Keyboard remapping
- **zathura**: PDF viewer
- **zsh**: Zsh shell (with oh-my-zsh)
