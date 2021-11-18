require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/characters', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Character. As you add validations to Character, be sure to
  # adjust the attributes here as well.
  # ____________________________________________________________________________ #
  let(:valid_attributes) do
    { url_picture: 'picture.net/characters/AAAAA',
      name: 'AAAAA', age: 62, weight: 0.58,
      history: 'AAAAAAAAAAAAAAAAAAAAAA AAAAAAAAAAAAAAAAAAAAAAAAAAA...' }
  end

  let(:invalid_attributes) do
    { url_picture: 'url',
      name: 1, age: '62', weight: nil,
      history: {} }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # CharactersController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    { "Authorization": get_token }
  end

  # ____________________________________________________________________________ #
  describe 'GET /index' do
    it 'renders a successful response' do
      Character.create! valid_attributes
      get characters_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      character = Character.create! valid_attributes
      get character_url(character), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Character' do
        expect do
          post characters_url,
               params: { character: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Character, :count).by(1)
      end

      it 'renders a JSON response with the new character' do
        post characters_url,
             params: { character: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Character' do
        expect do
          post characters_url,
               params: { character: invalid_attributes }, as: :json
        end.to change(Character, :count).by(0)
      end

      it 'renders a JSON response with errors for the new character' do
        post characters_url,
             params: { character: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { url_picture: 'picture.net/characters/AAAAA+Z',
          name: 'AAAAA+Z', age: 32, weight: 100.58,
          history: 'AAAAAAAAAAAAAAAAAAAAAA+Z AAAAAAAAAAAAAAAAAAAAAAAAAAA...+Z' }
      end

      it 'updates the requested character' do
        character = Character.create! valid_attributes
        patch character_url(character),
              params: { character: new_attributes }, headers: valid_headers, as: :json
        character.reload
        # assertions for updated state
        character_json = JSON.parse(response.body)
        expect(character_json['url_picture']).to eq('picture.net/characters/AAAAA+Z')
        expect(character_json['name']).to eq('AAAAA+Z')
        expect(character_json['age']).to eq(32)
        # Decimal/BigDecimal in ruby is a very precise number.
        # Javascript/JSON doesn't have a data type that is as precise as ruby's BigDecimal.
        expect(character_json['weight']).to eq('100.58')
        expect(character_json['history']).to eq('AAAAAAAAAAAAAAAAAAAAAA+Z AAAAAAAAAAAAAAAAAAAAAAAAAAA...+Z')
      end

      it 'renders a JSON response with the character' do
        character = Character.create! valid_attributes
        patch character_url(character),
              params: { character: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the character' do
        character = Character.create! valid_attributes
        patch character_url(character),
              params: { character: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested character' do
      character = Character.create! valid_attributes
      expect do
        delete character_url(character), headers: valid_headers, as: :json
      end.to change(Character, :count).by(-1)
    end
  end
end