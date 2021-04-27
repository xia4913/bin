#!/bin/sh -Ceu

if [ -z "${COMMAND_LS:-}" ]; then
	eval "$(env-config ls)"
fi

case $COMMAND_LS in
exa)
	flags=-aF
	if [ "${COLORTERM:-}" != truecolor ]; then
		flags="$flags --color=never"
	fi
	;;
*)
	flags=-AF
esac
case $(basename "$0") in
ll)
	flags="$flags -l"
	case $COMMAND_LS in
	exa)
		flags="$flags -g --git"
	esac
esac
# shellcheck disable=SC2086
exec "$COMMAND_LS" ${flags:-} "$@"
