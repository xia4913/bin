#!/bin/sh -Ceu

if is-redirected stdin; then
	set -- --no-line-number "$@"
fi
rg --ignore-case --pretty --hidden "$@"
