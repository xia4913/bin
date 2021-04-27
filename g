#!/bin/sh -Ceu

if [ -z "${COMMAND_GREP:-}" ]; then
	eval "$(env-config grep)"
fi

flags=-i
case $(basename "$0") in
gf)
	flags="$flags -F"
	;;
gfw)
	flags="$flags -Fw"
esac

case $COMMAND_GREP in
rg)
	flags="$flags -p"
	if is-redirected stdin; then
		flags="$flags -N"
	fi
	RIPGREP_CONFIG_PATH="$HOME"/.config/ripgrep/config
	export RIPGREP_CONFIG_PATH
	;;
grep)
	;;
esac
# shellcheck disable=SC2086
"$COMMAND_GREP" $flags "$@" | p
