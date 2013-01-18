# Easiest way to parse a cookbook's metadata file

Assuming you have the `chef` gem installed, it's pretty simple to parse the `metadata.rb` file that comes with every Chef cookbook:

```ruby
#!/usr/bin/env ruby

require 'chef/cookbook/metadata'

metadata_file = ARGV.first || 'metadata.rb'

# read in metadata
metadata = Chef::Cookbook::Metadata.new
metadata.from_file(metadata_file)

# output cookbook name and version
puts "#{metadata.name} #{metadata.version}"

# output cookbook dependencies
metadata.dependencies.each { |cookbook, version| puts "#{cookbook} #{version}" }
```

With `pry`, we can see what the complete metadata API looks like:

```ruby
[1] pry(main)> require 'chef/cookbook/metadata'
=> true
[2] pry(main)> metadata = Chef::Cookbook::Metadata.new
=> #<Chef::Cookbook::Metadata:0x00000002a81180
 @attributes={},
 @conflicting={},
 @cookbook=nil,
 @dependencies={},
 @description="A fabulous new cookbook",
 @groupings={},
 @license="none",
 @long_description="",
 @maintainer="YOUR_COMPANY_NAME",
 @maintainer_email="YOUR_EMAIL",
 @name="",
 @platforms={},
 @providing={},
 @recipes={},
 @recommendations={},
 @replacing={},
 @suggestions={},
 @version=0.0.0>
```

Last but not least, if you're interested in the actual implementation of Chef's `Metadata` class, [here's the source code.](https://github.com/opscode/chef/blob/master/lib/chef/cookbook/metadata.rb)

_Published on [Coderwall](https://coderwall.com/p/wwt0sw) on 2013-01-10_
