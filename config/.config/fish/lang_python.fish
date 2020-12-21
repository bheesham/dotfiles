set -Ux PYENV_ROOT $HOME/.pyenv
set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths
set -Ux PYENV_SHELL fish
pyenv init - | source
