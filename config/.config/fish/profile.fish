if not test "$TERM" = "dumb"
  fish_vi_key_bindings
end

set -gx EDITOR vim
set -gx HOMEBREW_EDITOR vim
set -gx SHELL /usr/local/bin/fish

if which rg > /dev/null
    alias tg "rg --type-add 'conf:*.conf' --type-add 'jenkins:Jenkinsfile' --type-add 'npl:*.npl' --type-add 'schema:*.schema' --type-add 'docker:Dockerfile' --type-add 'tf:*.tf'"
end

alias ku "kubectl"
alias dc "docker-compose"
alias please "sudo"
alias notes "vim $HOME/notes"

function fish_prompt -d "Customize the fish prompt."
  echo 🦥 @ (hostname) / (basename (pwd)) / (date +'%Y-%m-%d %H:%M:%S')
  echo -n "🐡> "
end

function fish_greeting
    if which fortune > /dev/null
        fortune
    end
end

echo -n 🧑
