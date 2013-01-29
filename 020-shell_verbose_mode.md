# Simple verbose mode for your shell scripts

Sometimes shell scripts are too verbose. There's too much output and constant grepping becomes a pain very soon. So you add a `--quiet` or `--verbose` option to your script, causing it to show less or more information, respectively.

At this point, you can either clutter your code with lots of _if verbose then/else_ logic, or you make use of redirections as shown here:

```sh
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
```

And the same code in action:

```sh
$ sh verbose.sh
Hai!

$ sh verbose.sh --verbose
This goes to stdout.
This goes to stderr.
Hai!

$ sh verbose.sh --verbose >/dev/null
This goes to stderr.

$ sh verbose.sh --verbose 2>/dev/null
This goes to stdout.
Hai!
```

_Published on [Coderwall](https://coderwall.com/p/xxx) on 2013-01-29_
