function fish_prompt
    set_color blue
    echo -n (prompt_pwd)
    echo -n '  '
end
alias vim='nvim'
function ssh
    env TERM=xterm-color ssh $argv
end
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
alias p='sudo pacman'
zoxide init fish | source
