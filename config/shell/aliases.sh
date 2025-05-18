#  _  _
# | || |
# | __ |
# |_||_|
#

# functions {{{

# gitignore
gi() {
	for i in ${@}; do
		curl -sL https://www.toptal.com/developers/gitignore/api/${i}
	done
}

# emacs client
em() {
	nohup emacsclient -c -a 'emacs' "$@" 2>&1 > /dev/null &
}

# take
take() {
	if [ -d "${1}" ]; then
		cd "${1}"
	else
		mkdir -p "${1}" && cd "${1}"
	fi
}

# abduco + dvtm [session manager + multiplexer]
a() {
	read -p 'new session? (y/N) ' choice
	if [ "${choice}" = 'y' ]; then
		read -p 'name: ' name
		if [ -z "${name}" ]; then
			name=session-$(date +%y%m%d-%H%M%S)-$(abduco | wc -l)
		else
			name="${name}"
		fi
		abduco -c ${name} dvtm-status -m ^B
		unset name
	fi
	unset choice
}

# live grep
lg() {
	if [ -z ${1} ]; then
		match="cat"
		pattern=''
	else
		match="grep -n"
		pattern="${1}"
	fi
	if [ -z "${2}" ]; then
		dir="."
	else
		dir="${2}"
	fi
	grep -c "${pattern}" $(find ${dir} -type f) \
		| grep -v ':0$' \
		| awk -F ':' '{print $1;}' \
		| fzf --preview "{ highlight -O ansi {} 2>/dev/null || cat {}; } \
				| ${match} ${pattern} \
				| sed -e 's/:/: /' -e 's/^    //'" \
			# --preview-window=right,30%
		# | fzf --preview "grep -n ${pattern} {} | sed 's/:/| /'"
}
# }}}

# aliases {{{
alias evil='emacs --init-dir ~/.config/evil'

alias bc="bc -q"

alias :q="exit"

# alias sudo="doas"

# if [ -n "${DISPLAY}" ] && [ -n "${SUDO_ASKPASS}" ]; then
# 	alias sudo="sudo -A"
# 	alias yay="yay --sudoflags '-A'"
# fi

alias c='clear'
alias q="exit"
alias x='startx'

alias lf="lfub"
alias mdp="mdp -f"

# alias eza="exa --sort extension --group-directories-first --icons"
# alias exa="eza"
# alias tree='exa -T --icons'
# alias ts='exa -T --icons -L 1'
# alias ll="eza -l"
alias ls='ls -X --color=always --group-directories-first'
alias ll="ls -lhFX -tr"
alias la="ll -a"
alias cls="clear; ll"
alias cl="clear; ls"

alias tb="nc termbin.com 9999"
alias links="links -download-dir $HOME/downloads/"
alias aria2c='aria2c -m 0 -x 16 -c'
alias ddg='links https://duckduckgo.com'

# alias pwgen='pwgen -cyns'
alias psgen='pwgen'
alias psgn='pwgen'
alias pwgn='pwgen'

# alias t='tmux'
alias sc='screen'
alias m='cmus'

# alias poweroff='shutdown -h now'

alias screenfetch='screenfetch -w'
alias fetchmaster='fm6000 -r -c random'
alias fm4000="fm4000 -w -r -c random"
alias pfetch='fastfetch --config ~/.config/fastfetch/minimal.jsonc --logo void_small'
alias neofetch='fastfetch -c paleofetch'

alias clear="clear && printf '\e[3J'"

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias grep='grep --color=auto'
# alias lat='bat -n --style=plain --paging=always'
# alias bat='bat -P --style=plain'
alias bat="highlight -l -O ansi"
alias plow="glow -p"
alias lolcat='lolcat -S 7'

alias ..="cd .."
alias ...="cd ../.."

alias gln='git clone'
alias gss="git status -s"
alias gic="git init && git add . && git commit -m 'Create repo'"
alias gls="git log --oneline --all --graph --decorate"
alias glg="gls --graph --stat"
alias gll="git log --stat --graph --all --show-signature"
alias grv="git remote -v"

#alias ed="ed -p ':'"

alias gpg-agent-reload="gpg-connect-agent reloadagent /bye"

alias bup="brightnessctl s +10%"
alias bdown="brightnessctl s 10%-"

alias cowsay="cowsay -f tux"

alias script='script -c dash'

alias gost0="$HOME/temp/gost/gost-linux-amd64-3.0.0-beta.5/gost-linux-amd64-3.0.0-beta.5 -L :8000 -F ws://user:pass@soni.sambadak.ml:80"
alias gost1="$HOME/temp/gost/gost-linux-amd64-3.0.0-beta.5/gost-linux-amd64-3.0.0-beta.5 -L :8080 -F relay+grpc://user:pass@132.145.100.92:8000"
#alias gost1="$HOME/temp/gost/gost-linux-amd64-3.0.0-beta.5/gost-linux-amd64-3.0.0-beta.5 -L :8000 -F relay+grpc://user:pass@116.203.195.247:25569"
alias gost2="$HOME/temp/gost/gost-linux-amd64-3.0.0-beta.5/gost-linux-amd64-3.0.0-beta.5 -L :8000 -F relay+phts://116.203.195.247:25566"
alias gost3="$HOME/temp/gost/gost-linux-amd64-3.0.0-beta.5/gost-linux-amd64-3.0.0-beta.5 -L :8000 -F socks5+ws://user:pass@116.203.195.247:25567"
alias gost4="$HOME/temp/gost/gost-linux-amd64-3.0.0-beta.5/gost-linux-amd64-3.0.0-beta.5 -L :8000 -F socks5+h2://user:pass@116.203.195.247:25568"
alias gost5="$HOME/temp/gost/gost-linux-amd64-3.0.0-beta.5/gost-linux-amd64-3.0.0-beta.5 -L :8000 -F relay+grpc://user:pass@116.203.195.247:25569"
#alias gost6="$HOME/temp/gost/gost-linux-amd64-3.0.0-beta.5/gost-linux-amd64-3.0.0-beta.5 -L :8000 -F http2://user:pass@116.203.195.247:25570"

alias ssh-connect="ssh root@195.201.56.167"

alias yarn='yarn --use-yarnrc "${XDG_CONFIG_HOME}/yarn/config"'

alias hs="hugo server --disableFastRender"

alias irssi="irssi --config=${XDG_CONFIG_HOME}/irssi/config --home=${XDG_DATA_HOME}/irssi"

alias pico="nano -f ~/.config/nano/pico.conf"
# alias nano="nano -f ~/.config/nano/nano.conf"
# alias vim="vim -u ~/.vim/init.vim"
# alias vi="vim -u ~/.config/vim/vimrc"
# alias vi="vim -u ~/.vim/vimrc"
# alias nvi="$(which vi)"
# alias vim="$(which vim) -u ~/.config/vi/init.vim"
# alias vim="$(which nvim)"
# alias vim="nvim"
# alias vi="nvim"

alias ip="ip -c"

# alias fzf="fzf -m --reverse -i --border=sharp --prompt=: --marker=\* --info=inline --header-first --no-unicode"
alias fzf="fzf -m --reverse -i --border=sharp --prompt=: --marker=\* --info=inline --header-first"

alias cava="cli-visualizer -c ~/.config/vis/cava.conf"

alias ip='ip -c'

alias nnn='nnn -ed -T e -R -A'

# alias gs="echo come one dude! again?!"

alias pres="zathura --mode=fullscreen"
# }}}

