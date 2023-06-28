# ZSH Configuration

This directory contains configuration files for ZSH shell. You need to install `OhMyZSH` framework in order to be able to use this configuration. Bellow you will find steps on how to install and deploy configuration files from this directory.

To install `OhMyZSH`, you can follow these steps:


1. Install ZSH: If Zsh is not already installed on your system, you'll need to install it first:
   ```
   sudo pacman -S zsh
   ```
2. Set ZSH as the default shell: After installing Zsh, you need to set it as your default shell. Run the following command to change the default shell:
   ```
   chsh -s $(which zsh)
   ```

3. Install `OhMyZSH`: Once Zsh is set as the default shell, you can install OhMyZsh by running the following command:
   ```
   sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

   This command downloads and runs the `OhMyZSH` installation script.

4. Configure `OhMyZSH`: You can use `likner.sh` script to deploy ZSH configuration:
   ```
   ./linker.sh --apply zsh
   ```

   /Note/: make sure to remove default `.zshrc` before deploying the custom configuration: `rm ~/.zshrc`.


# Plugins

## virtualenvwrapper

This configuration includes `virtualenvwrapper`, which is a tool built on top of `virtualenv` to simplify the creation and management of virtual environments. The primary purpose of this plugin is to automatically activate the virtual environment when you navigate to a Python project directory. It requires that the virtual environment name matches the project name. Please ensure that you have `virtualenvwrapper` installed in order to utilize this feature.

To install `virtualenvwrapper`, run the following command:

```
sudo pacman -S virtualenvwrapper
```

