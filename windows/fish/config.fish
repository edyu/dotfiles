function fish_prompt
	set_color $fish_color_cwd
	echo -n (prompt_pwd)
	set_color normal
	echo -n ' > '
end
set -gx EDITOR nvim
set -gx VISUAL nvim
#source ~/.cargo/env

alias vi nvim

alias l ls
alias ll 'ls -la'
alias ls 'ls --color -FG'
