# Main
class ApplicationController < ActionController::API
  def not_found
    render json: { error: 'not_found' }
  end

  # Verify that the header sends a valid JsonWebToken
  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      # The token has expired
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      # The token is not valid
      render json: { errors: "#{e.message} go to /auth/login" }, status: :unauthorized
    end
  end
end
