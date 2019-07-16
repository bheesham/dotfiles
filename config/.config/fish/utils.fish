function cls -d "clear and ls"
    clear
    ls
end

function prune_git -d "Prunes all git branches that have been merged."
  set branch master

  if which -s git
     and test -d .git
    set branch (env GIT_PAGER=cat git branch | awk -e '/\* (.+)$/ { print $2; }')
  end

  if test -n $argv[1]
     and test "$argv[1]" != ""
    set branch $argv[1]
  end
  git branch --merged="$branch" | grep -v "$branch" | xargs git branch -d
end

function try_source -d "Attempts to source a file if it exists."
  for path in $argv
    if test -e $path
      source $path
    end
  end
end

function try_add_path -d "Attempts to add a directory to $PATH."
  for path in $argv
    if test -d $path
      set -x PATH $PATH $path
    end
  end
end

function try_add_fish_user_path -d "Attempts to add a directory to $fish_user_path."
  for path in $argv
    if test -d $path
      set -x fish_user_paths $fish_user_paths $path
    end
  end
end

