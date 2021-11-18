class JsonWebToken
  # Is the key for encoding and decoding token
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  # <payload> key-value object for holding data that want to be encoded
  # <exp> token expiration time
  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  # Decode the token that given by user
  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end
