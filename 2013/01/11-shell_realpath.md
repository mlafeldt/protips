# Get real absolute path to a directory in Shell

If you're a Ruby programmer, you might know that `Pathname#realpath` returns the real (absolute) path to a file or directory in the actual filesystem without symlinks or useless dots.

For example:

```ruby
[1] pry(main)> require 'pathname'
=> true
[2] pry(main)> Pathname.new('/tmp/bar').realpath.to_s
=> "/tmp/foo"
```

In shell, you can implement something similar with this function:

    realpath() { (cd -P -- "${1:-.}" && pwd) }

Some notes:

- Only works for _existing_ directories (not for files).
- This function is portable, while `readlink(1)` is not even part of POSIX.
- Both `cd` and `pwd` understand `-P` to resolve all symbolic links and operate on the physical path.
- The same method can be used to get the directory your shell script lives in: `APP_ROOT="$(cd -P -- $(dirname -- "$0") && pwd)"`

_Published on 2013-01-11_
