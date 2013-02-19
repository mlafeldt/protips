# Git alias to generate the changelog

When releasing a new version of a project, I usually document the changes since the last release in _CHANGELOG.md_ (or _HISTORY.md_). For this, I used to take the output of `git shortlog` and edit it manually.

Now, as I'm a lazy programmer, I've written [git changelog](https://github.com/mlafeldt/dotfiles/blob/ad028e4711881851b14c7470e1fbc8d10e230d6d/git/gitconfig#L11) - a Git alias that generates the changelog for me.

Without any argument, `git changelog` will print all changes since the last tag:

```sh
$ git changelog 
Changelog for v0.1.2..HEAD
* Update to md_inc v0.2.8
* Add JekyllPage class
* Remove trailing empty lines from content
* Re-add quotes to post title
* Add Travis config (no tests yet)
* Add HISTORY.md file
```

As you can see, the output is Markdown and can be inserted into _CHANGELOG.md_ almost as-is.

Last but not least, you can pass `git changelog` a commit range like this:

```sh
$ git changelog v0.1.0..v0.1.1
```

_Published on [Coderwall](https://coderwall.com/p/ch-wew) on 2013-02-19_
