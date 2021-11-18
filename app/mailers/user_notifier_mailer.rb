class UserNotifierMailer < ApplicationMailer
  default from: ENV['FROM_TO']

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail(to: @user.email,
         subject: 'Thanks for signing up for Mundo_Disney_API')
  end
end
