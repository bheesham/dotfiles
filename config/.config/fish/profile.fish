if not test "$TERM" = "dumb"
  fish_vi_key_bindings
end

set -x EDITOR vim
set -x HOMEBREW_EDITOR vim
set -x SHELL /usr/local/bin/fish

alias ku "kubectl"
alias dc "docker-compose"
alias please "sudo"
alias notes "vim $HOME/notes"

function fish_prompt -d "Customize the fish prompt."
  echo (whoami) @ (hostname) / (basename (pwd))
  echo -n '$ '
end
