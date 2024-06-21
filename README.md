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
(see [Tmux] section).

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
