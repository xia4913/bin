#!/bin/sh -Ceu

if [ -z "${COMMAND_SELECTOR:-}" ]; then
	eval "$(env-config selector)"
fi
exec "$COMMAND_SELECTOR" "$@"
