# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!


# ______________________________________________________________________________
# https://docs.sendgrid.com/for-developers/sending-email/rubyonrails
ActionMailer::Base.smtp_settings = {
  # This is the string literal 'apikey', NOT the ID of your API key
  user_name: 'apikey',
  # This is the secret sendgrid API key which was issued during API key creation
  password: ENV['API_KEY_SENDGRID'],
  domain: 'localhost',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}
