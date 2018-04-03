# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f ~/dev/auvik_scripts/bin/auvikrc ]; then
    . ~/dev/auvik_scripts/bin/auvikrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
