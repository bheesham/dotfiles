fish_vi_key_bindings

set -x PATH /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/gnu-sed/bin /usr/local/bin /usr/local/sbin $HOME/bin /bin /sbin /usr/bin /usr/sbin $HOME/.cabal/bin $HOME/.rvm/bin $HOME/.local/bin /usr/lib/node_modules/express-generator/bin/ $HOME/.cargo/bin /usr/local/MacGPG2/bin /Library/TeX/texbin

set -x DEP_OPENSSL_INCLUDE /usr/local/opt/openssl/include
set -x OPENSSL_INCLUDE_DIR /usr/local/opt/openssl/include
set -x OPENSSL_LIB_DIR /usr/local/opt/openssl/lib

alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vi="vim"
set -x EDITOR vim
set -x HOMEBREW_EDITOR vim

function fish_prompt
  echo -n (whoami)' $ '
end
