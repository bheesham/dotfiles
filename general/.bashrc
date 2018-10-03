# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

export PATH=/Users/bheesham/.local/bin:$PATH

if [ -f ~/.bash_work ]; then
    source ~/.bash_work
fi
