function try_add_path -d "Attempts to add a directory to $PATH."
  for path in $argv
    if test -d $path
      set -x PATH $PATH $path
    end
  end
end

function fish_prompt -d "Customize the fish prompt."
  echo (whoami) @ (hostname) / (basename (pwd))
  echo -n '$ '
end

function cls -d "clear and ls"
    clear
    ls
end

set -x GOPATH $HOME/go
set -x GOBIN $GOPATH/bin

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

if not test "$TERM" = "dumb"
  fish_vi_key_bindings
end

if uname -a | grep -q Darwin
  set -x DEP_OPENSSL_INCLUDE /usr/local/opt/openssl/include
  set -x OPENSSL_INCLUDE_DIR /usr/local/opt/openssl/include
  set -x OPENSSL_LIB_DIR /usr/local/opt/openssl/lib
end

for trout in $HOME/.config/fish/work.fish $HOME/.config/fish/priv.fish $HOME/.asdf/asdf.fish
  if test -e $trout
    source $trout
  end
end

set -x EDITOR vim
set -x HOMEBREW_EDITOR vim
set -x SHELL /usr/local/bin/fish

alias ku "kubectl"
alias dc "docker-compose"
alias please "sudo"
set -g fish_user_paths "/usr/local/opt/curl/bin" $fish_user_paths

# opam configuration
source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
set -g fish_user_paths "/usr/local/opt/bison/bin" $fish_user_paths
