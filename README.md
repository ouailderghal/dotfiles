# Configuration Files Repository

This repository contains a collection of configuration files for various tools and applications. Each file is tailored to enhance the functionality and customize the settings of its corresponding software. Below is a list of the included configuration files:

- **alacritty**: Configuration file for Alacritty, a fast, cross-platform terminal emulator.
- **git**: Configuration file for Git, a widely-used version control system.
- **i3status**: Configuration file for i3status, a status bar generator for the i3 window manager.
- **nvim**: Configuration file for Neovim, an enhanced version of the Vim text editor.
- **terminator**: Configuration file for Terminator, a feature-rich terminal emulator for Unix-like operating systems.
- **xmodmap**: Configuration file for Xmodmap, a utility for modifying keymaps in X.
- **i3**: Configuration file for i3, a tiling window manager known for its simplicity and efficiency.
- **neofetch**: Configuration file for Neofetch, a command-line system information tool.
- **tmux**: Configuration file for Tmux, a terminal multiplexer that allows managing multiple terminal sessions within a single window.
- **zsh**: Configuration file for Zsh, a powerful shell with extensive customization options.

## Installation Instructions (Arch Linux)

To use these configuration files on an Arch-based system, follow the steps below:

1. **Alacritty**: Install Alacritty: `sudo pacman -S alacritty`
2. **Git**: Install Git: `sudo pacman -S git`
3. **i3status**: Install i3status: `sudo pacman -S i3status`
4. **Neovim**: Install Neovim: `sudo pacman -S neovim`
5. **Terminator**: Install Terminator: `sudo pacman -S terminator`
6. **Xmodmap**: No installation is required for Xmodmap. 
7. **i3**: Install i3 window manager: `sudo pacman -S i3`
8. **Neofetch**: Install Neofetch: `sudo pacman -S neofetch`
9. **Tmux**: Install Tmux: `sudo pacman -S tmux`
11. **Zsh**: Install Zsh: `sudo pacman -S zsh`
12. **Awesome**: Install Awesome: `sudo pacman -S awesome`

Feel free to explore and utilize these configuration files according to your needs. They aim to provide a starting point for customizing the corresponding tools and applications to suit your preferences.

## `linker.sh`

The `linker.sh` script allows you to easily deploy configuration files from this repository to your local machine using symbolic links. Follow the steps below to utilize the script effectively:

**Prerequisites:**

- Make sure you have `stow` installed on your system. If you are using Arch, you can install it by running the command: `sudo pacman -S stow`.

**Steps:**

1. Clone this repository to your local machine:

   ```shell
   git clone https://github.com/ouailderghal/dotfiles.git
   ```

2. Navigate to the directory where the `linker.sh` script is located:

   ```shell
   cd /path/to/dotfiles
   ```

3. Make the script executable:

   ```shell
   chmod +x linker.sh
   ```

4. Apply a configuration:

   ```shell
   ./linker.sh --apply configuration_name
   ```

   Replace `configuration_name` with the name of the specific configuration you want to apply.

   For example:

   ```shell
   ./linker.sh --apply tmux
   ```

   This will create symbolic links for the `tmux` configuration files in their respective locations.

5. Unapply a configuration:

   ```shell
   ./linker.sh --unapply configuration_name
   ```

   Replace `configuration_name` with the name of the configuration you want to unapply.

   For example:

   ```shell
   ./linker.sh --unapply tmux
   ```

   This will remove the symbolic links created for the `tmux` configuration files.

Note: Ensure that the necessary dotfiles and configurations are present in the repository's directory structure before applying them using the `linker.sh` script.

