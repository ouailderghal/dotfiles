# Packages

List of packages that I have installed on my `Arch Linux` machine. Packages from the **Official Arch repositories** 
are listed in `packages.txt` file, and packages from **Arch User Repository (AUR)** are listed in `packages-aur.txt` 
file.

## Install packages from official repository :

Run the following command to install all packages present in `packages.txt` :

```shell
sudo pacman -S - < packages.txt
```

## Install packages from AUR :

In order to get access to the AUR, you need to have `yay` installed. To do so, you have to clone `yay` repository and
build it on your machine :

```shell
git clone --depth 1 https://aur.archlinux.org/yay /tmp/yay
cd /tmp/yay
makepkg -si
```

You can now install AUR packages present in `packages-aur.txt` by running the following command :

```shell
yay -S - < packages-aur.txt
```
