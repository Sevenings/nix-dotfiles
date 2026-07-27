function y() {
	local tmp_cwd="$(mktemp -t "yazi-cwd.XXXXXX")" 
	local tmp_cmd="$(mktemp -t "yazi-cmd.XXXXXX")" 
    YAZI_POST_CMDS="$tmp_cmd" yazi "$@" --cwd-file="$tmp_cwd"

    # Switches to the CWD
	if cwd="$(command cat -- "$tmp_cwd")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp_cwd"

    # Executes the CMD
    if [ -s "$tmp_cmd" ]; then
        eval "$(cat "$tmp_cmd")"
    fi
    rm -f -- "$tmp_cmd"
}

function yy() {
    y
}
