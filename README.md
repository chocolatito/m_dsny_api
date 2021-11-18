# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

# Ruby version:
```
ruby-2.5.5
```
## Ruby on Rails version:
```
Rails 6.1.4.1
```

---
# System dependencies
> add or uncomment in `/Gemfile` the following gems

---
### [bcrypt](https://rubygems.org/gems/bcrypt/versions/3.1.11)
> Hash algorithm designed for hashing passwords.
```
gem 'bcrypt', '~> 3.1.7'
```

---
### [rspec-rails](https://rubygems.org/gems/rspec-rails)
> Testing framework for Rails 5+.
> In to `group :development, :test do` block, add:
```
group :development, :test do
  # ...
  gem 'rspec-rails'
  # ...
end
```
---
### [active_model_serializers 0.10.2](https://rubygems.org/gems/active_model_serializers/versions/0.10.2)
> Allows you to generate your JSON in an object-oriented and convention-driven manner.

```
gem 'active_model_serializers', '~> 0.10.2'
```

---
### [sendgrid-ruby](https://github.com/sendgrid/sendgrid-ruby)
> Allows use the Twilio SendGrid Web API v3 via Ruby
```
`gem 'sendgrid-ruby'
```

---
### [jwt](https://jwt.io/)
> Allows you to decode, verify and generate Json Web Token (JWT).
```
gem 'jwt'
```

---
### [figaro](https://jwt.io/)
> Parses a Git-ignored YAML file in your application and loads its values into ENV.
```
gem 'figaro'
```
---

# Configuration
In `m_disny_api` directory run the following commands:

> Download and install the gems

`$ bundle install`

> Generate boilerplate configuration files

`$ rails generate rspec:install`

> **Atention** If show you the next message
```sh
. . .
. . .
Overwrite /home/chocolatito/ruby/m_dsny_api/spec/spec_helper.rb? (enter "h" for help) [Ynaqdhm]

```

> Enter `n`

> Create `/config/application.yml`

`$ bundle exec figaro install`

---
# Database initialization
```
rails db:migrate
rails db:migrate:status
rails db:seed
```
You can read the migration for the models in `db/migrate/`

The script to generate the initial records is in `db/seeds.rb`





---
# How to run the test suite
```
rspec spec/requests/
rspec spec/routing/
```

---
# Services (job queues, cache servers, search engines, etc.)

See endpoint documentation at: [https://documenter.getpostman.com/view/18347954/UVCCd3Ua](https://documenter.getpostman.com/view/18347954/UVCCd3Ua)
