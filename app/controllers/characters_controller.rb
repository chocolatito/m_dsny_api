class CharactersController < ApplicationController
  before_action :authorize_request
  before_action :set_character, only: %i[show update destroy]
  before_action :set_characters, only: %i[index]

  # GET /characters
  def index
    render json: @characters, each_serializer: CharacterSerializer
  end

  # GET /characters/1
  def show
    render json: @character, serializer: CharacterDetailSerializer
  end

  # POST /characters
  def create
    @character = Character.new(character_params)

    if @character.save
      render json: @character, serializer: CharacterDetailSerializer, status: :created, location: @character
    else
      render json: @character.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /characters/1
  def update
    if @character.update(character_params)
      render json: @character, serializer: CharacterDetailSerializer
    else
      render json: @character.errors, status: :unprocessable_entity
    end
  end

  # DELETE /characters/1
  def destroy
    render json: @character, serializer: CharacterDetailSerializer, status: :ok if @character.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_character
    @character = Character.find(params[:id])
  end

  # Characters for :name, :age and :movies (Cast.id_movie)
  # or all Characters
  def set_characters
    @characters = if params[:name]
                    Character.by_name(params[:name])
                  elsif params[:age]
                    Character.by_age(params[:age])
                  elsif params[:movies]
                    Character.by_movies(params[:movies])
                  else
                    Character.all
                  end
  end

  # List of trusted parameters through.
  def character_params
    params.require(:character).permit(:url_picture, :name, :age, :weight, :history)
  end
end
