# Configuration Files Repository

This repository contains a collection of configuration files for various tools
and applications that I use in my daily workflow. The files are organized to be
deployed to the appropriate locations in your home directory using [GNU Stow](https://www.gnu.org/software/stow/).

Ensure you have Stow version `2.4.0` or later installed. Most Linux repositories
include the latest version of Stow. If your repository does not, follow the
steps below to compile it from source:

```bash
wget -c http://ftp.gnu.org/gnu/stow/stow-2.4.0.tar.gz
tar xvaf stow-2.4.0.tar.gz && cd stow-2.4.0
./configure
make && sudo make install
```

## Deploy Configuration Files to Home Directory

After installing Stow, you can deploy the configuration files. Stow creates
symlinks for each directory and file in the current project, placing them in the
home directory. The project's file tree corresponds to the locations where the
configuration files will be deployed. Stow will automatically replace
`dot-something` with `.something` and place it in the correct location.

To proceed with deploying the configuration files, run the commands below or use
the `install.sh` script from the root of the repository:

```bash
git clone https://github.com/ouailderghal/dotfiles /path/to/dotfiles/
cd /path/to/dotfiles
stow . -t $HOME --dotfiles --verbose --adopt
```

## Available Configurations

### Alacritty

My preferred terminal is Alacritty. It is a simple, fast, GPU-rendered terminal
with minimal functionality compared to other terminal applications (no windows,
tabs, splits, etc.). I prefer using a minimal terminal application and
delegating window, split, and tab management to a specialized tool like Tmux
(see Tmux section).

The latest version of Alacritty uses a TOML configuration file, whereas older
versions used a YAML format. Since not all Linux repositories have the latest
version of Alacritty, it is recommended to compile it from source. Alacritty is
written in Rust, so you need to install a [Rust compiler](https://rustup.rs/),
Cargo, and other dependencies to compile it.

```bash
git clone https://github.com/alacritty/alacritty.git && cd alacritty
rustup override set stable
rustup update stable
sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
cargo build --release --no-default-features --features=wayland # with Wayland support
cargo build --release --no-default-features --features=x11 # with X11 support
```

### Tmux

Tmux is my go-to tool for terminal multiplexing. I use it to manage and quickly
switch between projects and workspaces. It integrates well with the Alacritty
terminal as it does not overlap with any functionality of the terminal
application. The main modifier key in Tmux is `<C-s>`, along with other
keybindings and shorthands I have defined to make the Tmux experience smoother
and faster.

The configuration file also includes four plugins (listed below), and their
installation is managed using [tpm](https://github.com/tmux-plugins/tpm). Please
ensure that you have `tpm` installed before using Tmux.

1. `tmux-sensible`: Default configurations and shorthands for Tmux.
2. `tmux-yank`: Copies selected text from Tmux to the system clipboard.
3. `tmux-battery`: Shows the battery percentage in the status bar.
4. `tmux-resurrect`: Saves opened sessions, allowing them to persist after a restart.

Run the command below to clone the `tpm` project to your home directory, then
start a Tmux session and press `<C-s I>` to install the plugins.

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### `i3`

I use `i3`, a keyboard-driven window manager, alongside the
[Xfce](https://www.xfce.org/) desktop environment. This setup allows me to
efficiently manage windows using my keyboard while Xfce handles other settings
like displays, brightness, and power management. `i3` is available in most Linux
repositories, and I usually install it using my system's package manager:

```bash
sudo apt install i3 i3lock suckless-tools
```

The repository also includes a configuration file for `i3status`, which displays
information such as the clock and network interface status on the status bar.

### Shell (Bash and Zsh)

I use [Zsh](https://www.zsh.org/) with the [oh-my-zsh](https://ohmyz.sh/)
framework. All of my shell configuration is defined in a single file named
`dot-zshrc`. The repository also includes a configuration file for the Bash
shell (`dot-bashrc`). Configurations for both shells load aliases from the
`dot-bash_aliases` file.

```bash
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Other Configurations

This repository includes configuration files for various tools that I use in my
daily workflow, as listed below:

1. `git`: Contains settings for commit email, GPG commit signing, and
   configurations that load in specific directories on my system.

2. `lf`: A fast terminal [file manager](https://github.com/gokcehan/lf) written
   in Go. To install it, run the following command:

   ```bash
   env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest
   ```

3. `neofetch`: Configuration file for the Neofetch command-line utility, which
   displays useful system information such as the OS, kernel version, and
hardware model.

4. `terminator`: Configuration file for the
   [Terminator](https://gnome-terminator.org/) terminal application.

5. `mimeapps.list`: Defines default programs for specific file types.

6. `ideavim`: Configuration file for the
   [Ideavim](https://github.com/JetBrains/ideavim) JetBrains plugin.

7. `xmodmap`: Configuration file for keyboard overrides.

### Scripts

The repository also includes helper scripts that I use to automate parts of my
workflow. These scripts are located under `dot-local/bin` and will be deployed
to the local bin directory, which is added to the global `PATH` variable (refer
to the Zsh configuration file for details).

The available scripts are:

1. **`spawn-alacritty-cwd`**: A helper script that opens a new Alacritty window
   in the current working directory. The script is triggered using `C-S-n` from
   within an Alacritty window.

2. **`tmux-sessionizer`**: A script that launches `fzf` with a list of
   predefined directories, creates a new Tmux session named after the selected
   folder, and opens several default windows (`term`, `nvim`, `lazygit`, etc.).
