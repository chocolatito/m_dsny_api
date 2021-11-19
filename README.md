# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

# Ruby version:
```sh
ruby-2.5.5
```
## Ruby on Rails version:
```sh
Rails 6.1.4.1
```

---
# System dependencies
> add or uncomment in `/Gemfile` the following gems

---
### [bcrypt](https://rubygems.org/gems/bcrypt/versions/3.1.11)
> Hash algorithm designed for hashing passwords.
```sh
gem 'bcrypt', '~> 3.1.7'
```

---
### [rspec-rails](https://rubygems.org/gems/rspec-rails)
> Testing framework for Rails 5+.
> In to `group :development, :test do` block, add:
```sh
group :development, :test do
  # ...
  gem 'rspec-rails'
  # ...
end
```
---
### [active_model_serializers 0.10.2](https://rubygems.org/gems/active_model_serializers/versions/0.10.2)
> Allows you to generate your JSON in an object-oriented and convention-driven manner.

```sh
gem 'active_model_serializers', '~> 0.10.2'
```

---
### [sendgrid-ruby](https://github.com/sendgrid/sendgrid-ruby)
> Allows use the Twilio SendGrid Web API v3 via Ruby
```sh
`gem 'sendgrid-ruby'
```

---
### [jwt](https://jwt.io/)
> Allows you to decode, verify and generate Json Web Token (JWT).
```sh
gem 'jwt'
```

---
### [figaro](https://jwt.io/)
> Parses a Git-ignored YAML file in your application and loads its values into ENV.
```sh
gem 'figaro'
```
---

# Configuration
In `m_disny_api` directory run the following commands:

> Download and install the gems
```sh
$ bundle install`
```

> Generate boilerplate configuration files

```sh
$ rails generate rspec:install
```

> **Atention** If show you the next message
```sh
. . .
. . .
Overwrite /home/chocolatito/ruby/m_dsny_api/spec/spec_helper.rb? (enter "h" for help) [Ynaqdhm]
```

> Enter `n`

> Create `/config/application.yml`
```sh
$ bundle exec figaro install
```

---
# Database initialization
```sh
rails db:migrate
rails db:migrate:status
rails db:seed
```
You can read the migration for the models in `db/migrate/`

The script to generate the initial records is in `db/seeds.rb`

---
# Environment variables for ActionMailer
> see the file `/mailers/user_notifier_mailer.rb`
```ruby
# ...

default from: ENV['FROM_TO']

#...
```
> and in the file `config/environment.rb`
```ruby
# . . .

password: ENV['API_KEY_SENDGRID'],

# . . .
```
necesitara definir los siguientes valores en `/config/application.yml`
```ruby
API_KEY_SENDGRID: '<SENDGRID_API_KEY>'
FROM_TO: <email_sendgrid>
```
> See more information [here](https://docs.sendgrid.com/for-developers/sending-email/rubyonrails)



---
# How to run the test suite
> run all tests
```sh
rspec spec/
```

> or, partially

```sh
rspec spec/requests/
rspec spec/mailers/
rspec spec/models/
rspec spec/routing/
```

---
# Services

See endpoint documentation at: [https://documenter.getpostman.com/view/18347954/UVCCd3Ua](https://documenter.getpostman.com/view/18347954/UVCCd3Ua)
