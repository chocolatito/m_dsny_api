require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:token) { { "Authorization": get_token } }
  describe 'GET /users' do
    before { get '/users', headers: token, as: :json }
    it 'returns all users' do
      expect(JSON.parse(response.body).size).to eq(1)
    end
    it 'returns status code 200' do
      expect(response.status).to eq(200)
    end
  end
  describe 'POST /users' do
    before do
      post '/users',
           headers: token,
           params: { email: 'user_a@example.com', password: 'password_a' }
    end
    it 'returns the new user' do
      require 'bcrypt'
      user_json = JSON.parse(response.body)
      expect(user_json['email']).to eq('user_a@example.com')
      expect(BCrypt::Password.new(user_json['password_digest'])).to eq('password_a')
    end
    it 'returns status code 201' do
      expect(response.status).to eq(201)
    end
  end
end
