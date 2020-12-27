#!/bin/sh -eu

list=$(list-prog)
flags=
case $list in
exa)
	flags=-aF
	if [ "${COLORTERM:-}" != truecolor ]; then
		flags="$flags --color=never"
	fi
	;;
*)
	flags=-AF
	;;
esac
# shellcheck disable=SC2086
exec "$list" $flags "$@"
