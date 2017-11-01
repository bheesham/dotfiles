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

export PS1="`whoami` $ "
