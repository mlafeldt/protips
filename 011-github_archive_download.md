# Download code snapshot from GitHub without using Git

This will download all files from a GitHub repo at a given ref (e.g. `master`) to the current folder:

    $ curl -L https://github.com/:owner/:repo/tarball/:ref | tar xz --strip=1

Additionally, you may want to pass `-C DIR` to tar to change the output directory.

_Published on 2013-01-16_
