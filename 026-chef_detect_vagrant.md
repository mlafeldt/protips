# Detect if cookbook is run by Vagrant

If you, for whatever reason, want to know whether your cookbook is being run by Vagrant, you can find it out this way:

```ruby
if node[:instance_role] == 'vagrant'
  # do something that should only be done inside
  # a Vagrant box
end
```

Of course, this assumes that you do not overwrite `node[:instance_role]`.

_Published on [Coderwall](https://coderwall.com/p/yz-ngw) on 2013-03-24_
