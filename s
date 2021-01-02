#!/bin/sh -eu

readonly query="${1:-}"
flags='--select-1 --height 0 --layout reverse'
if [ -n "$query" ]; then
	flags="$flags --query $query"
fi
# shellcheck disable=SC2086
exec sk $flags
