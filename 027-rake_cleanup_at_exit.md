# Running a Rake task once at exit

While Rake makes it easy to define that a task has one or more prerequisites, I
learned that it's hard to define a task that is executed once after one or more
tasks have finished, e.g. running a _cleanup_ task at the end of _all_ test
tasks.

I fiddled around with `Rake::Task#enhance` and tried to add some intermediate
tasks. I didn't like the bloated result. I came up with this solution instead:

```ruby
namespace :test do
  task :prepare do
    # Set up tests...

    # Run cleanup at exit unless an exception was raised.
    at_exit { Rake::Task['test:cleanup'].invoke if $!.nil? }
  end

  task :cleanup do
    # Clean up tests...
  end

  task :lint => :prepare do
    # Run lint checks...
  end

  task :spec => :prepare do
    # Run spec examples...
  end

  task :all => [:lint, :spec]
end
```

Here, `test:cleanup` is really only run once after `test:lint`, `test:spec`, or
`test:all`. No `Rake::Task#enhance`. No intermediate steps.

_Published on [Coderwall](https://coderwall.com/p/smghmw) on 2013-04-08_
