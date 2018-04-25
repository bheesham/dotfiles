# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export PATH=/Users/bheesham/.local/bin:$PATH

if [ -f ~/.bash_work ]; then
	. ~/.bash_work
fi
