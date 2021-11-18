class CastsController < ApplicationController
  before_action :authorize_request
  before_action :set_cast, only: %i[show update destroy]

  # GET /casts
  def index
    @casts = Cast.all
    render json: @casts
  end

  # GET /casts/1
  def show
    render json: @cast
  end

  # POST /casts
  def create
    @cast = Cast.new(cast_params)
    if @cast.save
      render json: @cast, status: :created, location: @cast
    else
      render json: @cast.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /casts/1
  def update
    if @cast.update(cast_params)
      render json: @cast
    else
      render json: @cast.errors, status: :unprocessable_entity
    end
  end

  # DELETE /casts/1
  def destroy
    render json: @cast, status: :ok if @cast.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cast
    @cast = Cast.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cast_params
    params.require(:cast).permit(:movie_id, :character_id)
  end
end
