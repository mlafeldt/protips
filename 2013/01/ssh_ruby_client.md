# SSH client with Kerberos support in two lines of Ruby

First, install the gems `net-ssh` and `net-ssh-kerberos` (the latter requires Ruby < 1.9, unfortunately).

Then save this to a file called `ssh-krb` and make it executable:

```ruby
#!/usr/bin/env ruby
%w(net/ssh net/ssh/kerberos).each { |lib| require lib }
puts Net::SSH.start(ARGV.shift, ENV['USER'], :auth_methods => ["gssapi-with-mic", "publickey"]).exec! ARGV.join(" ")
```

Now you can run the script like this: `ssh-krb <hostname> <command>`
