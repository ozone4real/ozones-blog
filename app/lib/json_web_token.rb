class JsonWebToken
  SECRET_KEY = Rails.application.credentials.secret_key_base

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    puts payload
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded

  # rescue JWT::DecodeError => e
  #   # raise custom error to be handled by custom handler
  #   raise ExceptionHandler::InvalidToken, e.message
  
  rescue JWT::ExpiredSignature => e
    raise ExceptionHandler::ExpiredToken, e.message
  end
end
