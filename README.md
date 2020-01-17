# EpicHashCleaner
[![Build Status](https://travis-ci.org/i22-digitalagentur/epic-hash-cleaner.svg?branch=master)](https://travis-ci.org/i22-digitalagentur/epic-hash-cleaner)

Removes recursively nil and empty elements from a hash

```ruby
# Examples

EpicHashCleaner.clean { a: nil, b: '', c: [], d: {} }
# => {}

EpicHashCleaner.clean { a: false, b: ' ' }
# => { a: false }

EpicHashCleaner.clean { a: [nil], b: [nil, '', [{}], { a: [''] }] }
# => {}

EpicHashCleaner.clean { a: { b: { c: [{ d: ['', 1], e: nil }] } } }
# => { a: { b: { c: [{ d: [1] }] } } }

EpicHashCleaner.clean nil
# => {}
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'epic_hash_cleaner'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install epic_hash_cleaner


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/i22-digitalagentur/epic-hash-cleaner


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

