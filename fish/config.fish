function try_add_path -d "Attempts to add a directory to $PATH."
  for path in $argv
    if not test -d $path
      return 1
    end

    set -x PATH $PATH $path
  end
end

function fish_prompt -d "Customize the fish prompt."
  echo (whoami) @ (hostname) / (basename (pwd))
  echo -n '$ '
end

try_add_path /bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin \
             $HOME/bin $HOME/.cargo/bin $HOME/.cabal/bin $HOME/.rvm/bin \
             $HOME/.local/bin \
             /usr/local/MacGPG2/bin /Library/TeX/texbin \
             /usr/local/opt/coreutils/libexec/gnubin \
             /usr/local/opt/gnu-sed/bin \
             /usr/lib/node_modules/express-generator/bin/

if not test "$TERM" = "dumb"
  fish_vi_key_bindings
end

if uname -a | grep -q Darwin
  set -x DEP_OPENSSL_INCLUDE /usr/local/opt/openssl/include
  set -x OPENSSL_INCLUDE_DIR /usr/local/opt/openssl/include
  set -x OPENSSL_LIB_DIR /usr/local/opt/openssl/lib
end

for trout in $HOME/.config/work/extras.fish $HOME/.config/priv/extras.fish
  if test -e $trout
    source $trout
  end
end

set -x EDITOR vim
set -x HOMEBREW_EDITOR vim

alias dc="docker-compose"
