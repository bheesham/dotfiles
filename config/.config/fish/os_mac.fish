if uname | grep -q Darwin
    function kill_display -d "Restarts the UI server for Mac"
        sudo killall SystemUIServer
    end

    function clear_dns_cache -d "Clear DNS cache"
        sudo bash -c 'dscacheutil -flushcache && killall -HUP mDNSResponder'
    end

    alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs --no-window-system"

    set -gx DYLD_FALLBACK_LIBRARY_PATH /usr/local/opt/openssl/lib

    set -gx PYENV_ROOT $HOME/.pyenv
    set -gx PYENV_SHELL fish

    try_add_path (pyenv root)/shims
    try_add_path /usr/local/opt/llvm/bin

    echo -n 🍎
end
