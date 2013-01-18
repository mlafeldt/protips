# Calculate checksum for Chef's remote_file resource

The [remote_file resource](http://docs.opscode.com/resource_remote_file.html) that comes with Chef accepts an optional `checksum` attribute, which is

    The SHA-256 checksum (or portion thereof) of the file. If the local file matches the checksum, Chef will not download it. Default value: nil.

I'm using the checksum in my [git::source recipe](https://github.com/mlafeldt/git-cookbook/blob/1.0.6/recipes/source.rb#L37) to make sure the Git source tarball is only downloaded once.

Here's how I calculated (and shortened) it:

    $ curl -L -s https://github.com/gitster/git/tarball/v1.8.1 | shasum -a 256 | cut -c-12
    1a9d87a5e898

And in case you already have the file on your hard disk:

    $ shasum -a 256 /path/to/file | cut -c-12

_Published on [Coderwall](https://coderwall.com/p/xxx) on 2013-01-18_
