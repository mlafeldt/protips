# Terminal colors with tput

Using `echo -e` and escape sequences for terminal colors is a bad habit. The portable alternative is [tput](http://en.wikipedia.org/wiki/Tput).

This shell snippet - copied 1:1 from [Git's source code](https://github.com/git/git/blob/master/t/test-lib.sh) - implements a simple `say_color` function based on tput:

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

Here's how to call `say_color`:

    say_color error "Text should be bold red"
    say_color skip  "Text should be blue"
    say_color warn  "Text should be yellow"
    say_color pass  "Text should be green"
    say_color foo   "Text should be uncolored"

In my terminal, the result looks like this:

![Picture](https://coderwall-assets-0.s3.amazonaws.com/uploads/picture/file/1110/tput.png)
