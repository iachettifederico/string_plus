# StringPlus

Some stuff I like on `String`s.

## Methods added

### `#camelcase`

Convert a space/underscore-separated String into camel case.

```ruby
require "string_plus"
"hello_cool_world".camelcase
# => "HelloCoolWorld"
```

### `#lcamelcase`

Convert a space/underscore-separated String into lower camel case.

```ruby
require "string_plus"
"hello_cool_world".lcamelcase
# => "helloCoolWorld"
```


### `#constantize`

Convert a string into a constant.

Acknowledgments:

* The `String` will be first camel-cased.
* You're not creating a Constant, but retrieving it. So, if it doesn't already exist, it will raise an error.

```ruby
require "string_plus"
"basic_object".constantize
# => BasicObject
```


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'string_plus'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install string_plus

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/string_plus/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
