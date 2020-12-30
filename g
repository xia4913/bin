#!/bin/sh -eu

if is-command-available rg; then
	RIPGREP_CONFIG_PATH="$HOME"/.config/ripgrep/config exec rg -ip "$@"
else
	exec grep -i "$@"
fi | p
