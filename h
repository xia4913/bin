#!/bin/sh -Ceu

for i in "$@"; do
	case $i in
	-[n0-9]*)
		has_line_option=true
		;;
	--)
		break
	esac
done
if [ "${has_line_option:-}" != true ]; then
	lines=$(tput lines)
	set -- -n $(( lines - 2 )) "$@"
fi

case $(basename "$0") in
h)
	command='head'
	;;
t)
	command='tail'
esac
exec "$command" "$@"
