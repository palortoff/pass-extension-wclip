#!/bin/bash

clip() {
        local sleep_argv0="password store sleep on display $DISPLAY"
        pkill -f "^$sleep_argv0" 2>/dev/null && sleep 0.5
        local before="$(/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe get-clipboard | base64)"
        /mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe set-clipboard \'$1\' || die "Error: Could not copy data to the clipboard"
        (
                ( exec -a "$sleep_argv0" sleep "$CLIP_TIME" )
                local now="$(/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe get-clipboard | base64)"
                if [[ $now != $(echo "$1" | base64) ]]; then
                        /mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe set-clipboard \'$(echo $before | base64 -d)\'
                fi
        ) 2>/dev/null & disown
        echo "Copied $2 to clipboard using wclip --secret. Will clear in $CLIP_TIME seconds."
}
cmd_show --clip "$@"
