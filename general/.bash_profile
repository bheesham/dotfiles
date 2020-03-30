# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

set -o vi

alias l='ls -l'
alias ll='ls -lh'
alias la='ll -a'
alias ..='cd ..'

PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

export PS1="`whoami` $ "
alias tg="rg --type-add 'conf:*.conf' --type-add 'jenkins:Jenkinsfile' --type-add 'npl:*.npl' --type-add 'schema:*.schema' --type-add 'docker:Dockerfile' --type-add 'tf:*.tf'"

export PYENV_SHELL=bash
