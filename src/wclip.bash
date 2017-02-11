#!/bin/bash

clip() {
	local sleep_argv0="password store sleep on display $DISPLAY"
	pkill -f "^$sleep_argv0" 2>/dev/null && sleep 0.5
	local before="$(base64 < /dev/clipboard)"
	echo -n "$1" | wclip --secret || die "Error: Could not copy data to the clipboard"
	(
		( exec -a "$sleep_argv0" sleep "$CLIP_TIME" )
		local now="$(base64 < /dev/clipboard)"
		[[ $now != $(echo -n "$1" | base64) ]] && before="$now"
		echo "$before" | base64 -d | wclip --secret
	) 2>/dev/null & disown
	echo "Copied $2 to clipboard using wclip --secret. Will clear in $CLIP_TIME seconds."
}

cmd_show --clip "$@"
