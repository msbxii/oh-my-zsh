USER_HOST="%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%}"

function collapse_pwd {
	echo $(pwd | sed -e "s,^$HOME,~,")
}
function color_pwd {
	COLOR1="%{$fg_bold[green]%}"
	TEXT="${PWD/#$HOME/~}"
	END="%{$reset_color%}"

	echo "${COLOR1}${TEXT}${END}"
}

function prompt_char {
	git branch > /dev/null 2> /dev/null && echo '±' && return
	hg root > /dev/null 2> /dev/null && echo '☿' && return
	echo '$'
}

PROMPT='$USER_HOST in $(color_pwd) $(git_prompt_info)
$(prompt_char) '


ZSH_THEME_GIT_PROMPT_PREFIX="on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# vim: set filetype=sh :
