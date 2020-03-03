# Gitlabarty
A bare-bones gem for making Gitlab API requests

1. Can only do issue CRUD actions
1. Needs your personal-access-token which you should have stored when activating 2FA: [Gitlab API](https://docs.gitlab.com/ee/api/#personal-access-tokens)
1. I might work on this more, I might not
1. No tests as of yet, living' dat yolo life

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

Set config:
```rb
Gitlabarty.configuration do |config|
  config.url = "https://your.project.com/api/v4/projects/" # url to your project
  config.id = 1 # id of the project you want to create issues in
  config.private_token = "your-personal-access-token" # your personal access token for the gitlab project
end
```

Create an issue: [gitlab API](https://docs.gitlab.com/ee/api/issues.html#new-issue)
```rb
Gitlabarty.create_issue(:options)
```

Update/Edit an issue: [gitlab API](https://docs.gitlab.com/ee/api/issues.html#edit-issue)
```rb
Gitlabarty.update_issue(:issue_id, :options)
```

Read/Get an issue: [gitlab API](https://docs.gitlab.com/ee/api/issues.html#single-issue)
```rb
Gitlabarty.read_issue(:issue_id)
```

Delete/Destroy an issue: [gitlab API](https://docs.gitlab.com/ee/api/issues.html#delete-an-issue)
```rb
Gitlabarty.delete_issue(:issue_id)
```

Responses are all JSON objects, as per the gitlab API docs.

### Table of available options: (No validation yet)

Option | Type | Required |Description
---|---|---|---
title | String | yes | The title of an issue
description | String | no | The description of an issue. Limited to 1,048,576 characters.
confidential | Boolean | no | Set an issue to be confidential. Default is false.
assignee_ids | Integer | array | no	The ID of a user to assign issue
milestone_id | Integer | no | The global ID of a milestone to assign issue
labels | String | no | Comma-separated label names for an issue
created_at | String | no | Date time string, ISO 8601 formatted, e.g. 2016-03-11T03:45:40Z (requires admin or project/group owner rights)
due_date | String | no | Date time string in the format YEAR-MONTH-DAY, e.g. 2016-03-11
merge_request_to_resolve_discussions_of | Integer | no | The IID of a merge request in which to resolve all issues. This will fill the issue with a default description and mark all discussions as resolved. When passing a description or title, these values will take precedence over the default values.
discussion_to_resolve | String | no | The ID of a discussion to resolve. This will fill in the issue with a default description and mark the discussion as resolved. Use in combination with merge_request_to_resolve_discussions_of.
weight | 	Integer | no | The weight of the issue. Valid values are greater than or equal to 0.
epic_id | 	Integer | no | ID of the epic to add the issue to. Valid values are greater than or equal to 0.
epic_iid | 	Integer | no | IID of the epic to add the issue to. Valid values are greater than or equal to 0. (deprecated, will be removed in 13.0)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
