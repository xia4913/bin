#!/bin/sh -Ceu

if [ -n "${LESS_PAGING:-}" ]; then
	# shellcheck disable=SC2034
	LESS=$LESS_PAGING
fi
BAT_OPTS=--paging=always exec p "$@"
