class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # # GET /users/{username}
  # def show
  #   render json: @user, status: :ok
  # end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      # Deliver the signup email
      UserNotifierMailer.send_signup_email(@user).deliver
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # # PUT /users/{username}
  # def update
  #   render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
  # end

  # # DELETE /users/{username}
  # def destroy
  #   @user.destroy
  # end

  private

  def find_user
    @user = User.find_by_email!(params[:_email])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
