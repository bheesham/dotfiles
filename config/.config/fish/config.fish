source $HOME/.config/fish/utils.fish

set -gx PATH ""
try_add_path /sbin /bin \
             /usr/sbin /usr/bin \
             /usr/local/sbin /usr/local/bin \
             $HOME/Library/Python/3.7/bin \
             /usr/local/opt/imagemagick@6/bin \
             /usr/local/MacGPG2/bin \
             /Library/TeX/texbin \
             /usr/local/opt/coreutils/libexec/gnubin \
             /usr/local/opt/gnu-sed/bin \
             /usr/local/opt/python@2/libexec/bin \
             /usr/lib/node_modules/express-generator/bin \
             /usr/local/opt/bison/bin \
             /usr/local/smlnj/bin \
             /usr/local/opt/curl/bin \
             /usr/local/lib/ruby/gems/2.6.0/bin \
             /usr/local/opt/ruby/bin \
             $HOME/.rvm/bin \
             $HOME/.cabal/bin \
             $HOME/.cargo/bin \
             $HOME/.local/bin \
             $HOME/bin
echo -n 📍

try_source $HOME/.config/fish/profile.fish \
           $HOME/.config/fish/priv.fish \
           $HOME/.config/fish/lang_go.fish \
           $HOME/.config/fish/os_mac.fish \
           $HOME/.config/fish/work.fish \
           $HOME/.asdf/asdf.fish \
           $HOME/.opam/opam-init/init.fish
echo -n 🐟

echo !
