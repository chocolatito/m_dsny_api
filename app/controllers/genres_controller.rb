class GenresController < ApplicationController
  before_action :authorize_request
  before_action :set_genre, only: %i[show update destroy]

  # GET /genres
  def index
    @genres = Genre.all
    render json: @genres, each_serializer: GenreSerializer
  end

  # GET /genres/1
  def show
    render json: @genre, serializer: GenreDetailSerializer
  end

  # POST /genres
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      render json: @genre, status: :created, location: @genre
    else
      render json: @genre.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /genres/1
  def update
    if @genre.update(genre_params)
      render json: @genre, serializer: GenreDetailSerializer
    else
      render json: @genre.errors, status: :unprocessable_entity
    end
  end

  # DELETE /genres/1
  def destroy
    render json: @genre, status: :ok if @genre.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_genre
    @genre = Genre.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def genre_params
    params.require(:genre).permit(:name, :url_picture)
  end
end
