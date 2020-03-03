# Gitlabarty
A bare-bones gem for making Gitlab API requests

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gitlabarty'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gitlabarty

## Usage

Install the gem

Set config:
```rb
Gitlabarty.configuration do |config|
  config.url = "https://gitlab.example.com/api/v4/projects/" # url to your project
  config.id = 1 # id of the project you want to create issues in
  config.private_token = "your-private-access-token" # you should have stored this waaaaaaaay back
end
```

Create an issue: [gitlab API](https://docs.gitlab.com/ee/api/issues.html#new-issue)
```rb
Gitlabarty.create_issue(:options)
```

Update/Edit an issue: [gitlab API](https://docs.gitlab.com/ee/api/issues.html#edit-issue)
```rb
Gitlabarty.update_issue(:id, :options)
```

Read/Get an issue: [gitlab API](https://docs.gitlab.com/ee/api/issues.html#single-issue)
```rb
Gitlabarty.read_issue(:id)
```

Delete/Destroy an issue: [gitlab API](https://docs.gitlab.com/ee/api/issues.html#delete-an-issue)
```rb
Gitlabarty.delete_issue(:id)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/gitlabarty.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
