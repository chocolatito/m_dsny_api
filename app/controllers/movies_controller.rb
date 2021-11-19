class MoviesController < ApplicationController
  before_action :authorize_request
  before_action :set_movie, only: %i[show update destroy]
  before_action :set_movies, only: %i[index]

  # GET /movies
  def index
    render json: @movies, each_serializer: MovieSerializer
  end

  # GET /movies/1
  def show
    render json: @movie, serializer: MovieDetailSerializer
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render json: @movie, serializer: MovieDetailSerializer, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movies/1
  def update
    if @movie.update(movie_params)
      render json: @movie, serializer: MovieDetailSerializer
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movies/1
  def destroy
    render json: @movie, serializer: MovieDetailSerializer, status: :ok if @movie.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:id])
  end

  # Movies for :name (:title), :genre (:genre_id) and :order (ASC/DESC)
  # or all Movies
  def set_movies
    @movies = if params[:name]
                Movie.by_title(params[:name])
              elsif params[:genre]
                Movie.by_genre(params[:genre])
              elsif params[:order]
                Movie.ordered_by_title(params[:order])
              else
                Movie.all
              end
  end

  # List of trusted parameters through.
  def movie_params
    params.require(:movie).permit(
      :movie_or_serie, :url_picture, :title, :debut_date, :score, :genre_id
    )
  end
end
