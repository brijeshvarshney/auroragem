# Auroragem

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/auroragem`. To experiment with that code, run `bin/console` for an interactive prompt.

Auroragem is use for integration with aurora solar apis

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'auroragem'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install auroragem

## how to use

	* IN this gem Auroragem is main class which is to be initialized first. It require to pass two parameter "Aurora_api_key" and "aurora_secret_key".
	
	* This class will provide an object.

	*	object.tenants 						=>	"To show all tenants"
	*	object.get_tenants(id)				=>	"Get a tenant by id"
	*	object.users 						=>	"To show all users"
	*	object.get_user(id)					=>	"Get a user by id"
	*	object.invite_user(id)				=>	"To invite a user"
	*	object.create_user(id)				=>	"To create a user"
	*	object.projects 					=>	"To get all projects"
	*	object.get_projects(id)				=>	"Get a project by id"
	*	object.create_project(id)			=>	"Create a new project by an external_id_provider"
	*	object.design(id) 					=>	"Get a project design by id"
	*	object.design_summary(id)			=>	"Get design summary by id"
	*	object.create_design(id)			=>	"Create a new design summary by id"
	*	object.consumption_profile(id)		=>	"Get a consumption profile by id"
	*	object.create_consumption_profile(id)=>	"Create a consumption profile by id"
	*	object.components 					=>	"Get all components"
	*	object.get_component(id)			=>	"Get a component by id"


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/auroragem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

