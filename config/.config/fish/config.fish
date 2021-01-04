source $HOME/.config/fish/utils.fish

set -gx PATH ""
try_add_path /sbin /bin \
             /usr/sbin /usr/bin \
             /usr/local/sbin /usr/local/bin \
             /opt/local/bin \
             $HOME/Library/Python/3.7/bin \
             /Library/TeX/texbin \
             /usr/local/opt/imagemagick@6/bin \
             /usr/lib/node_modules/express-generator/bin \
             /usr/local/MacGPG2/bin \
             /usr/local/lib/ruby/gems/2.6.0/bin \
             /usr/local/opt/bison/bin \
             /usr/local/opt/coreutils/libexec/gnubin \
             /usr/local/opt/gnu-sed/libexec/gnubin \
             /usr/local/opt/curl/bin \
             /usr/local/opt/gambit-scheme/current/bin/ \
             /usr/local/opt/python@2/libexec/bin \
             /usr/local/opt/ruby/bin \
             /usr/local/smlnj/bin \
             $HOME/.rvm/bin \
             $HOME/.cabal/bin \
             $HOME/.cargo/bin \
             $HOME/.local/bin \
             $HOME/.emacs.d/bin \
             $HOME/bin
echo -n 📍

try_source $HOME/.config/fish/profile.fish \
           $HOME/.config/fish/priv.fish \
           $HOME/.config/fish/lang_python.fish \
           $HOME/.config/fish/lang_go.fish \
           $HOME/.config/fish/lang_java.fish \
           $HOME/.config/fish/os_mac.fish \
           $HOME/.config/fish/work.fish \
           $HOME/.asdf/asdf.fish \
           $HOME/.opam/opam-init/init.fish
echo -n 🐟

echo !
