# Testing code inside ruby_block with ChefSpec

I've recently written a [wrapper cookbook](https://github.com/mlafeldt/ruby-cookbook) that installs Ruby using rbenv and ruby_build.

The cookbook's default recipe looks like this:

```ruby
include_recipe 'ruby_build'
include_recipe 'rbenv::system'

# Fix PATH so that rbenv will be available immediately.
ruby_block "Add rbenv to PATH" do
  block do
    rbenv_root = node['rbenv']['root_path']
    ENV['PATH'] = "#{rbenv_root}/shims:#{rbenv_root}/bin:#{ENV['PATH']}"
  end
end
```

Writing ChefSpec examples for this turned out to be tricky, since the code inside the [ruby_block](http://docs.opscode.com/resource_ruby_block.html) is only evaluated during convergence and not at compile time. I could have written a simple RSpec matcher to check that the resource `ruby_block[Add rbenv to PATH]` is executed at all, but I wanted to verify the actual code as well (ChefSpec 0.9.0 doesn't support `ruby_block` by default).

As luck would have it, [this tip](https://gist.github.com/3808196#comment-580927) by Andrew Crump helped me to come up with the following spec:

```ruby
describe 'The recipe ruby::default' do
  let (:chef_run) do
    chef_run = ChefSpec::ChefRunner.new
    chef_run.node.automatic_attrs['platform'] = 'ubuntu'
    chef_run.converge 'ruby::default'
    chef_run
  end

  # ...

  it 'should add rbenv to PATH' do
    # run actual ruby_block resource to check PATH
    chef_run.resources.find { |r| r.name == 'Add rbenv to PATH' }.old_run_action(:create)
    rbenv_root = chef_run.node['rbenv']['root_path']
    ENV['PATH'].should include "#{rbenv_root}/shims"
    ENV['PATH'].should include "#{rbenv_root}/bin"
  end
end
```

As you can see, the only way to test code inside `ruby_block` is to actually converge the resource. I know that this is not always an option, but here it is.

_Published on 2013-01-15_
