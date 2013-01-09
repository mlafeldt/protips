Turns out it's pretty simple to parse a cookbook's `metadata.rb` file:

```ruby
  #!/usr/bin/env ruby
  
  require 'chef/cookbook/metadata'
  
  metadata_file = ARGV.first || 'metadata.rb'
  
  metadata = Chef::Cookbook::Metadata.new
  metadata.from_file(metadata_file)
  
  puts "#{metadata.name} #{metadata.version}"
  
  metadata.dependencies.each do |cookbook, version|
    puts "#{cookbook} #{version}"
  end
```

Nice.
