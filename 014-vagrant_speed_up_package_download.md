# Speed up package download in Vagrant boxes

Inside Vagrant boxes like http://files.vagrantup.com/lucid64.box, apt is configured to fetch Debian packages from US servers, e.g. _us.archive.ubuntu.com_.

For people outside the US, here's a one-liner you can add to your Vagrantfile that will speed up the package installation process (put it in front of other provisioners):

```ruby
config.vm.provision :shell, :inline => "sed -i 's/us.archive/de.archive/g' /etc/apt/sources.list"
```

This patches apt's `sources.list` file so that all packages will subsequently be downloaded from German servers, i.e. _de.archive.ubuntu.com_. Feel free to adapt it to your location.

_Published on [Coderwall](https://coderwall.com/p/habdwg) on 2013-01-21_
