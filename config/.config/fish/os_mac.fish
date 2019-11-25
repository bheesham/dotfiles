function kill_display -d "Restarts the UI server for Mac"
    sudo killall SystemUIServer
end

function clear_dns_cache -d "Clear DNS cache"
    sudo bash -c 'dscacheutil -flushcache && killall -HUP mDNSResponder'
end
