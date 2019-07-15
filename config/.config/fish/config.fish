source $HOME/.config/fish/utils.fish

set -x PATH ""
try_add_path $HOME/bin $HOME/.cargo/bin $HOME/.cabal/bin $HOME/.rvm/bin \
             $HOME/.local/bin \
             $HOME/Library/Python/3.7/bin \
             /usr/local/opt/imagemagick@6/bin \
             /usr/local/MacGPG2/bin /Library/TeX/texbin \
             /usr/local/opt/coreutils/libexec/gnubin \
             /usr/local/opt/gnu-sed/bin \
             /usr/local/opt/python@2/libexec/bin \
             /usr/lib/node_modules/express-generator/bin \
             /Applications/Postgres.app/Contents/Versions/9.5/bin \
             /usr/local/opt/bison/bin \
             $GOPATH/bin \
             /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin

# opam configuration
source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

try_add_fish_user_path /usr/local/opt/bison/bin \
                       /usr/local/opt/curl/bin

try_source $HOME/.config/fish/os_mac.fish \
           $HOME/.config/fish/work.fish \
           $HOME/.config/fish/priv.fish \
           $HOME/.asdf/asdf.fish \
           $HOME/.config/fish/profile.fish
