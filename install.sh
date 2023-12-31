#!/bin/sh

msg() { t=$1; shift; printf '%s: %s\n' "$t" "$@"; }

_ln_home() {
	[ -z "$2" ] && tgt="$HOME/$1" || tgt="$HOME/$2"
	src="$PWD/$1"
	[ -e "$tgt.bak" ] && rm -rf "$tgt.bak"
	[ -e "$tgt" ] && mv "$tgt" "$tgt.bak"
	ln -sf "$src" "$tgt"
}

_ln_cfg() {
  tgt=".config/$1"
  src="./config/$1"
  _ln_home $src $tgt
}
_mkdir() {
	for x; do
		mkdir -p "$HOME/$x"
	done
}

_make_config() {
  msg "Making Config dir"
  _mkdir ".config"
}

_make_config
_ln_cfg "fish"
_ln_cfg "alacritty"
_ln_cfg "nvim"
_ln_cfg "starship.toml"
_ln_cfg "tmux"
_ln_cfg "nix"
_ln_cfg "nixpkgs"
_ln_home "tmux" ".tmux"

nix-env -if $HOME/.config/nixpkgs/packages.nix

#
# _fish() {
#   _ln_home "fish" ".config/fish"
# }
#
# _alacritty() {
#   _ln_home "alacritt" ".config/alacritty"
# }
#
# _nvim() {
#   _ln_home "nvim" ".config/nvim"
# }
#
# _starfish() {
#   _ln_home "starship.toml" ".config/starship.toml"
# }
# _vim() {
# 	[ -n "$(command -v vim 2>/dev/null)" ] || return
# 	msg "INSTALL" "vim config"
# 	_ln_home "vimrc" ".vimrc"
# 	_ln_home "vim" ".vim"
# 	# install plugins
# 	# vim +PlugInstall +qall
# }
# _xorg() {
# 	[ -n "$(command -v Xorg 2>/dev/null)" ] || return
# 	msg "INSTALL" "xorg config"
# 	_ln_home "xinitrc" ".xinitrc"
# 	_ln_home "Xresources" ".Xresources"
# 	_ln_home "us-intl-german.xmodmap" ".us-intl-german.xmodmap"
# }
# _fonts() {
# 	[ -n "$(command -v Xorg 2>/dev/null)" ] || return
# 	msg "INSTALL" "fontconfig config"
# 	_mkdir ".config/fontconfig"
# 	_ln_home "fonts.conf" ".config/fontconfig/fonts.conf"
# }
# _mksh() {
# 	[ -n "$(command -v mksh 2>/dev/null)" ] || return
# 	msg "INSTALL" "mksh config"
# 	_ln_home "mkshrc" ".mkshrc"
# }
# _ksh() {
# 	[ -n "$(command -v ksh 2>/dev/null)" ] || return
# 	msg "INSTALL" "ksh config"
# 	_ln_home "kshrc" ".kshrc"
# }
# _yash() {
# 	[ -n "$(command -v yash 2>/dev/null)" ] || return
# 	msg "INSTALL" "yash config"
# 	_ln_home "yashrc" ".yashrc"
# }
# _shell() {
# 	msg "INSTALL" "shell config"
# 	_ln_home "profile" ".profile"
# 	_ln_home "inputrc" ".inputrc"
# 	_ln_home "aliases" ".aliases"
# }
# _git() {
# 	[ -n "$(command -v git 2>/dev/null)" ] || return
# 	msg "INSTALL" "git config"
# 	_ln_home "gitconfig" ".gitconfig"
# 	_ln_home "gitignore_global" ".gitignore_global"
# }
# _void() {
# 	[ -n "$(command -v xbps-install 2>/dev/null)" ] || return
# 	msg "INSTALL" "void config"
# 	_ln_home "xbps-src.conf" ".xbps-src.conf"
# }
# _ssh() {
# 	[ -n "$(command -v ssh 2>/dev/null)" ] || return
# 	msg "INSTALL" "ssh config"
# 	mkdir -p "$HOME/.ssh"
# 	_ln_home "ssh/config" ".ssh/config"
# }
# _bin() {
# 	msg "INSTALL" "user bin directory"
# 	_ln_home "bin"
# }
# _runit() {
# 	[ -n "$(command -v runsvdir 2>/dev/null)" ] || return
# 	msg "INSTALL" "runit user services"
# 	_ln_home "sv"
# 	_ln_home "service"
# 	_ln_home "service.x"
# }
# _gtk() {
# 	[ -n "$(command -v Xorg 2>/dev/null)" ] || return
# 	msg "INSTALL" "gtk config"
# 	_ln_home "gtkrc-2.0" ".gtkrc-2.0"
# 	_ln_home "gtk-3.0" ".config/gtk-3.0"
# }
# _firefox() {
# 	[ -n "$(command -v firefox 2>/dev/null)" ] || return
# 	printf "INSTALL: firefox user.js for profile: "
# 	for p in ~/.mozilla/firefox/*/; do
# 		p="${p%/*}"; p="${p##*/}"
# 		case "$p" in *backup*|*crashrecovery*|"") continue ;; esac
# 		printf " %s\n" "'${p}'"
# 		_ln_home "user.js" ".mozilla/firefox/$p/user.js"
# 		mkdir -p "$HOME/.mozilla/firefox/$p/chrome"
# 		_ln_home "userChrome.css" ".mozilla/firefox/$p/chrome/userChrome.css"
# 	done
# }
# _tmux() {
# 	[ -n "$(command -v tmux 2>/dev/null)" ] || return
# 	msg "INSTALL" "tmux config"
# 	_ln_home "tmux.conf" ".tmux.conf"
# }
#
# : ${PWD:=$(pwd)}
# : ${HOME:=~}
#
# _mksh
# _ksh
# _yash
# _shell
# _bin
# _runit
# _git
# _xorg
# _fonts
# _vim
# _void
# _ssh
# _gtk
# _firefox
# _tmux
