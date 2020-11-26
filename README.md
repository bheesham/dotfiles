## Installation

### MacOSX

```sh
brew install git stow gmake coreutils automake autoconf openssl libyaml readline libxslt libtool unixodbc pyenv jenv
git submodule update --init
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
gmake
cargo install ripgrep
mkdir ~/tmp
vim -c 'PlugInstall | qa'
```

### Fedora

```sh
sudo dnf install git stow make automake autoconf readline-devel ncurses-devel openssl-devel libyaml-devel libxslt-devel libffi-devel libtool unixODBC-devel
git submodule update --init
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
make
cargo install ripgrep
mkdir ~/tmp
vim -c 'PlugInstall | qa'
```
