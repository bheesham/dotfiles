if not test "$TERM" = "dumb"
  fish_vi_key_bindings
end

set -x EDITOR vim
set -x HOMEBREW_EDITOR vim
set -x SHELL /usr/local/bin/fish

if which -s rg
    alias tg "rg --type-add 'conf:*.conf' --type-add 'jenkins:Jenkinsfile' --type-add 'npl:*.npl' --type-add 'schema:*.schema' --type-add 'docker:Dockerfile' --type-add 'tf:*.tf'"
end

alias ku "kubectl"
alias dc "docker-compose"
alias please "sudo"
alias notes "vim $HOME/notes"

function fish_prompt -d "Customize the fish prompt."
  echo 🦥 @ (hostname) / (basename (pwd))
  echo -n "🐡> "
end
