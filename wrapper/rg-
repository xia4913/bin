#!/bin/sh -Ceu

if ! isatty stdin; then
	set -- --no-line-number "$@"
fi
rg --ignore-case --pretty --hidden --glob '!*.min.*' "$@"
