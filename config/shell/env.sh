#   ___ _ ____   __
#  / _ \ '_ \ \ / /
# |  __/ | | \ V / 
#  \___|_| |_|\_/  
#                  

# manpager {{{
# export MANPAGER='sh -c "col -b | vim -c \"set ft=man nomod nolist ignorecase\" -"'
# export MANPAGER="vimpager"
export MANPAGER="less"
# }}}

# global variables {{{
#export XDG_CACHE_HOME="${HOME}/.local/cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"

## gpg-agent
export GPG_TTY=$(tty)

## text editor
export EDITOR=nvim
export VISUAL=nvim

## md persentation tool
export MDP_LIST_OPEN1='   '
export MDP_LIST_OPEN2='   '
export MDP_LIST_OPEN3='   '
export MDP_LIST_HEAD1=' ● '
export MDP_LIST_HEAD2=' ○ '
export MDP_LIST_HEAD3=' • '

## texdoc
export PDFVIEWER_texdoc='zathura'

## Proxy
#export all_proxy=socks5://127.0.0.1:8080
#export http_proxy=http://127.0.0.1:1090
#export https_proxy=http://127.0.0.1:1090

## go Path
export GOPATH="${XDG_DATA_HOME}/golang"
export GOMODCACHE="${XDG_DATA_HOME}/golang/mod"
## rust Path
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
## cargo path
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
## npm path
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc "

### bat colorscheme
##"Solarized (dark)" "gruvbox-dark"
##"Nord" "Dracula"
#export BAT_THEME="Solarized (light)"

## locale/timezone settings
#export TZ="Tehran"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

## wine
export WINEPREFIX="${XDG_DATA_HOME}/wine"

## sudo
# export SUDO_ASKPASS="$(which dmenupass 2>/dev/null)"
#export SUDO_ASKPASS="$(which readpass 2>/dev/null)"
#export SUDO_ASKPASS="$(which yadmenu 2>/dev/null)"
# }}}

# source files {{{
sourceit() {
	if [ -f "${1}" ]; then
		source "${1}"
	fi
}

sourceit "${HOME}/.config/shell/aliases.sh"
sourceit "${HOME}/.config/lf/icons.sh"
sourceit "${HOME}/.local/share/cargo/env"

unset sourceit
# }}}

# path variable {{{
appendpath() {
	if [ -d "${1}" ]; then
		PATH="${PATH}:${1}"
	fi
}

appendpath "/opt/nekoray"
appendpath "${HOME}/bin"
appendpath "${HOME}/.bin"
appendpath "${HOME}/.local/bin"
appendpath "${HOME}/.local/bin/scripts"
appendpath "${HOME}/.config/emacs/bin"
appendpath "${HOME}/.emacs.d/bin"
appendpath "${XDG_DATA_HOME}/julia/bin"
appendpath "${XDG_DATA_HOME}/cargo/bin"
appendpath "${XDG_DATA_HOME}/golang/bin"
appendpath "${XDG_DATA_HOME}/yarn/bin"
appendpath "${XDG_DATA_HOME}/nvim/mason/bin"
# appendpath "${HOME}/.local/dev/hossein-lap/workflow/scripts"
# appendpath "${HOME}/.local/bin/texlive/2022/bin/x86_64-linux"
# appendpath "/usr/local/texlive/2022/bin/x86_64-linux/"

unset appendpath
# }}}#

QT_STYLE_OVERIDE=qt5ct
QT_QPA_PLATFORMTHEME=qt5ct

export SUDO_ASKPASS="$(which dmenupass)"

export ANSIBLE_NOCOWS=1
