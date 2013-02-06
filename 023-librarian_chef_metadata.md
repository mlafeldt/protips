# How to distribute your cookbook with a Cheffile

One of the coolest features of [Berkshelf](http://berkshelf.com) is the `metadata` source, which is similar to Bundler's `gemspec`. When you define `metadata` in your _Berksfile_, Berkshelf will install all dependencies defined in the _metadata.rb_ file located in the cookbook (directory) you're working on.

Unfortunately, [Librarian-Chef](https://github.com/applicationsonline/librarian) doesn't have the `metadata` shortcut. But you can mimic it this way inside your _Cheffile_:

```ruby
site "http://community.opscode.com/api/v1"

cookbook "name_of_your_cookbook", :path => "."
```

Ultimately, this trick allows you to distribute your cookbook together with a _Cheffile_ (which is good).

_Published on [Coderwall](https://coderwall.com/p/bx0rwq) on 2013-02-06_
