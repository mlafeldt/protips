#!/bin/sh

verbose=

case "$1" in
-v|--v|--ve|--ver|--verb|--verbo|--verbos|--verbose)
    verbose=1
    shift ;;
esac

if [ "$verbose" = 1 ]; then
    exec 4>&2 3>&1
else
    exec 4>/dev/null 3>/dev/null
fi

to_stdout() {
    echo "This goes to stdout."
}

to_stderr() {
    echo >&2 "This goes to stderr."
}

to_stdout >&3
to_stderr 2>&4
echo "Hai!"
