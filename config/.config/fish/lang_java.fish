if which jenv > /dev/null 2>/dev/null
    try_add_path $HOME/.jenv/bin
    try_add_path $HOME/.jenv/shims

    set -gx JENV_SHELL fish
    set -gx JENV_LOADED 1
    set -e JAVA_HOME

    if uname | grep -q Darwin
        try_source /usr/local/Cellar/jenv/(jenv --version | awk '{ print $2; }')/libexec/libexec/../completions/jenv.fish
    end

    jenv rehash 2>/dev/null
    function jenv
        set command $argv[1]
        set -e argv[1]

        switch "$command"
        case enable-plugin rehash shell shell-options
            source (jenv "sh-$command" $argv|psub)
        case '*'
            command jenv "$command" $argv
        end
    end

    echo -n ☕
end
