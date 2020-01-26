# Multiki

Gem allows you to run asynchronous tasks and them iterate thru results using standard Enumerable interface
to access the results, like `.each`, `.to_a`, `.reduce`, `.map` and so on.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'multiki'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install multiki

## Usage

1. Describe your asynchronous tasks as objects that respond to call method

```ruby
tasks = [
  ->{ call_api(...) },
  ->{ fetch_website(...) }
]
```

2. Pass tasks to `Multiki.new` object

```ruby
  multiki = Multiki.new(tasks)
```

3. Access results using standard enumerable methods:

```ruby
   multiki.each do |result|
     save_result_to_a_storage(result)
   end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bitofuniverse/multiki.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
