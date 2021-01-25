set -Ux PYENV_ROOT $HOME/.pyenv
try_add_path $PYENV_ROOT/bin
set -Ux PYENV_SHELL fish
pyenv init - | source
echo -n 🐍
