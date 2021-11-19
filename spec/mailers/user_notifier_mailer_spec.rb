require 'rails_helper'

RSpec.describe UserNotifierMailer, type: :mailer do
  describe 'notify' do
    user = User.new(email: 'example@example.com', password: 'password_t')
    mail = UserNotifierMailer.send_signup_email(user).deliver
    it 'renders the subject' do
      expect(mail.subject).to eq('Thanks for signing up for Mundo_Disney_API')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end
  end
end
