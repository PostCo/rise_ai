# RiseAi

Ruby gem for Rise.ai API

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add rise_ai

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install rise_ai

## Usage

**NOTE: Currently only supports the CustomTrigger resource**

### Configuration
1. Set your own Rise.ai secret key in your app's `config/initializers/rise_ai.rb`

```ruby
RiseAi.client_secrent = "your_secret_key"
```

### Custom Trigger Resource
1. Creating a Custom Trigger

```ruby
RiseAi::CustomTrigger.create(
  "shopify_domain",
  {
    cliend_id: "your_client_id",
    scheme: {
      variables: [
        {
          path: "customer_email",
          type: "Email",
          title: "Customer Email"
        }
      ],
      meta: {
        title: "Trigger title",
        description: "Trigger description"
      }
    }
  }
)
```

2. Executing a trigger
```ruby
RiseAi::CustomTrigger.execute(
  "trigger_id",
  { customer_email: "test@example.com", credit_amount: 100 }
)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/PostCo/rise_ai. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/rise_ai/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RiseAi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rise_ai/blob/main/CODE_OF_CONDUCT.md).
