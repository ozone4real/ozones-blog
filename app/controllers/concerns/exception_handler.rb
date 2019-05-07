module ExceptionHandler
  extend ActiveSupport::Concern

  class ExpiredToken < StandardError
  end

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message }, :unprocessable_entity)
    end

    rescue_from ExceptionHandler::ExpiredToken do |msg|
      json_response({ message: msg }, 401)
    end
  end
end
