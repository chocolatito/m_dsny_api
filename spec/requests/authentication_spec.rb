require 'rails_helper'

RSpec.describe 'Authentications', type: :request do
  let!(:user) { User.create(email: 'user@example.com', password: 'RailsPass') }
  describe 'POST /auth/login' do
    scenario 'valid user attributes' do
      post '/auth/login', params: { email: 'user@example.com', password: 'RailsPass' }
      parsed_body = JSON.parse(response.body)
      puts parsed_body['token']
      expect(response.status).to eq(200)
    end
  end
end
