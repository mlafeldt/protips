# Document your shell scripts with TomDoc

Even though [TomDoc](http://tomdoc.org) was originally specified to document Ruby code, it turns out to be a good fit for shell scripts too.

[tomdoc.sh](http://mlafeldt.github.com/tomdoc.sh) will parse TomDoc'd shell scripts and generate pretty documentation from it.

Here is how the documentation looks like:

```sh
# Public: Current API version in format "x.y.z".
export API_VERSION="1.2.3"

# Public: Execute commands in debug mode.
#
# Takes a single argument and evaluates it only when the test script is started
# with --debug. This is primarily meant for use during the development of test
# scripts.
#
# $1 - Commands to be executed.
#
# Examples
#
#   test_debug "cat some_log_file"
#
# Returns the exit code of the last command executed in debug mode or 0
#   otherwise.
test_debug() {
	test "$debug" = "" || eval "$1"
}
```

To learn more about tomdoc.sh, check out the [project page](http://mlafeldt.github.com/tomdoc.sh).

_Published on [Coderwall](https://coderwall.com/p/xxx) on 2013-01-22_
