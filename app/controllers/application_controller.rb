class ApplicationController < ActionController::Base
  add_flash_types :success, :danger, :info, :notice, :shown
  include Response
  include ExceptionHandler
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(decoded_auth_token[:id]) if decoded_auth_token
  end

  def logged_in?
    !!current_user
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(session[:token])
  rescue
    nil
  end

  def require_user
    unless logged_in?
      flash[:error] = "Unauthorized access"
      redirect_to root_path
    end
  end

  def require_admin
    unless current_user.is_admin?
      flash[:error] = "You are forbidden from performing that action"
      redirect_to root_path
    end
  end
end
