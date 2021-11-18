# Main
class ApplicationController < ActionController::API
  def not_found
    render json: { error: 'not_found' }
  end

  # Verifica que el header
  # envia un JsonWebToken valido (los token expiran en 24hs)
  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      # El token a expirado?
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      # El token no es valido?
      render json: { errors: "#{e.message} go to /auth/login" }, status: :unauthorized
    end
  end
end
