if uname | grep -q Darwin
    function kill_display -d "Restarts the UI server for Mac"
        sudo killall SystemUIServer
    end

    function clear_dns_cache -d "Clear DNS cache"
        sudo bash -c 'dscacheutil -flushcache && killall -HUP mDNSResponder'
    end

    alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs --no-window-system"

    set -x DYLD_LIBRARY_PATH /usr/local/opt/openssl/lib:$DYLD_LIBRARY_PATH
end
