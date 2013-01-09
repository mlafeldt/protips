Get real absolutized path to directory:

    realdir() { (cd -P -- "${1:-.}" && pwd) }

This function is portable, while `readlink(1)` is not even part of POSIX.

The same method can be used to get the directory your shell script lives in:

    APP_ROOT="$(cd -P -- $(dirname -- "$0") && pwd)"
