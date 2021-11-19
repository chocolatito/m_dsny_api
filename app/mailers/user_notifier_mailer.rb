class UserNotifierMailer < ApplicationMailer
  default from: ENV['FROM_TO']

  def send_signup_email(user)
    @user = user
    mail(to: @user.email,
         subject: 'Thanks for signing up for Mundo_Disney_API')
  end
end
