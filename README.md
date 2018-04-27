## Installation

### MacOSX

```sh
brew install stow gmake coreutils automake autoconf openssl libyaml readline libxslt libtool unixodbc
git submodule update --init
gmake
```

### Fedora

```sh
sudo dnf install stow make automake autoconf readline-devel ncurses-devel openssl-devel libyaml-devel libxslt-devel libffi-devel libtool unixODBC-devel
git submodule update --init
make
```
