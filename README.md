# MongoidDecimal

[![Build Status](https://travis-ci.org/calleo/mongoid_decimal.svg?branch=master)](https://travis-ci.org/calleo/mongoid_decimal)

Allows you to store Ruby BigDecimal as Decimal128 in MongoDB using Mongoid.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mongoid_decimal', git: 'https://github.com/calleo/mongoid_decimal'
```

And then execute:

    $ bundle

## Usage

Requires MongoDB version 3.4 or later. Don't forget to set feature compatibility version using the Mongo shell:

```db.adminCommand( { setFeatureCompatibilityVersion: "3.4" } )```

Read more about the implications [here](https://docs.mongodb.com/manual/reference/command/setFeatureCompatibilityVersion/#setfeaturecompatibilityversion-features). 

If you have existing BigDecimal fields that are stored as String in Mongo (Mongoid default behavior) you will need to perform a data migration of those fields to Decimal128 for this Gem to work properly.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/calleo/mongoid_decimal.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

