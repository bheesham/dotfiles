function cls -d "clear and ls"
    clear
    ls
end

function prune_git -d "Prunes all git branches that have been merged."
  set branch master

  if which git > /dev/null
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
      if test $status -ne 0
        echo "   "🐟- $path
      end
    end
  end
end

function try_add_path -d "Attempts to add a directory to $PATH."
  for path in $argv
    if test \( -d $path \) -a \( $path != "." \)
      set -gx PATH $path $PATH
      if test $status -ne 0
        echo "   "📍- $path
      end
    end
  end
end
