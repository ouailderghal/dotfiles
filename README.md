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
