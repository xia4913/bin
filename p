#!/bin/sh -Ceu

if is-redirected stdout; then
	exec cat "$@"
fi

if [ -z "${PAGER:-}" ]; then
	eval "$(env-config pager)"
fi
if is-redirected stdin; then
	exec "$PAGER" "$@"
fi

if [ -z "${COMMAND_DECORATOR:-}" ]; then
	eval "$(env-config decorator)"
fi
command=${COMMAND_DECORATOR:-$PAGER}
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
esac
# shellcheck disable=SC2086
exec "$command" ${flags:-} "$@"
