#!/bin/sh
# From 07-terminal_colors_with_tput.md
#
# Copied 1:1 from https://github.com/git/git/blob/master/t/test-lib.sh
#

ORIGINAL_TERM=$TERM
quiet=

[ "x$ORIGINAL_TERM" != "xdumb" ] && (
		TERM=$ORIGINAL_TERM &&
		export TERM &&
		[ -t 1 ] &&
		tput bold >/dev/null 2>&1 &&
		tput setaf 1 >/dev/null 2>&1 &&
		tput sgr0 >/dev/null 2>&1
	) &&
	color=t

if test -n "$color"
then
	say_color () {
		(
		TERM=$ORIGINAL_TERM
		export TERM
		case "$1" in
		error)
			tput bold; tput setaf 1;; # bold red
		skip)
			tput setaf 4;; # blue
		warn)
			tput setaf 3;; # brown/yellow
		pass)
			tput setaf 2;; # green
		info)
			tput setaf 6;; # cyan
		*)
			test -n "$quiet" && return;;
		esac
		shift
		printf "%s" "$*"
		tput sgr0
		echo
		)
	}
else
	say_color() {
		test -z "$1" && test -n "$quiet" && return
		shift
		printf "%s\n" "$*"
	}
fi


# Test colors
say_color error "Text should be bold red"
say_color skip  "Text should be blue"
say_color warn  "Text should be yellow"
say_color pass  "Text should be green"
say_color foo   "Text should be uncolored"
