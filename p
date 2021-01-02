#!/bin/sh -eu

if [ ! -t 1 ]; then
	exec cat "$@"
fi

command=${DECORATOR:-${PAGER:-less}}
case "$command" in
bat)
	case "$(echo "$@" | xargs -n1 | grep -cv -e '^-' -e '^$')" in
	0)
		flags='--style=rule'
		;;
	1)
		flags='--style=changes,numbers'
		;;
	*)
		flags='--style=changes,numbers,header'
		;;
	esac
	;;
esac
# shellcheck disable=SC2086
exec "$command" $flags "$@"
