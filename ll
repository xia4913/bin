#!/bin/sh -eu

flags=
case $(list-prog) in
exa)
	flags=-g
	;;
esac
# shellcheck disable=SC2086
exec l -l $flags "$@"
