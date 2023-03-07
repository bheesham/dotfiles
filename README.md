## Installation

This repository is now archived. I've moved to a different way of "managing" my
dotfiles: I don't. My machines have different usage profiles and I require
different things from them, so pretending I have One True Dotfiles Repo :tm:
ends up being a maintenance burden.

A maintenance burden because:

* different OS's have different ways of installing things;
* I want different shells in different places (cattle use bash, pets use fish);
* I change shells often (I lied just now, I don't _always_ bash or fish);
* language-specific customizations look different based on OS/platform.

I've given up on dealing with all of the above, opting to instead stick to
minimal customizations.

Personal shells:

* generally source any files under `~/.bashrc.d` or `~/.config/fish/`;
* vim remains mostly untouched;
* bash is customized to say
  ```
  set -o vi
  export PS1='; '
  export EDITOR=vi
  ```
* fish looks similar

OS:Language customizations are kept minimal, opting to use a better editor
(doom emacs, which is very lightly customized, or VS Code).

OS:Tools are mostly ad-hoc now, opting to use whatever's installed, only
installing when I need speed.

And other stuff. I also don't get new machines often enough for this code to be
tested and reliable.

I'll keep this here as a reference, but know it's unused, unmaintained, and
unmonitored.

Maybe I'll revisit my decision later, but it's been _a while_ since I've really
used this repo.

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
