# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
# https://docs.sendgrid.com/for-developers/sending-email/rubyonrails
ActionMailer::Base.smtp_settings = {
  # This is the string literal 'apikey'
  user_name: 'apikey',
  password: ENV['API_KEY_SENDGRID'],
  domain: 'localhost',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}
