class ApplicationController < ActionController::Base
  add_flash_types :success, :danger, :info, :notice
  include Response
  include ExceptionHandler
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    if session[:token]
      user = JsonWebToken.decode(session[:token])
      @current_user ||= User.find(user[:id])
    end
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:error] = "Unauthorized access"
      redirect_to root_path
    end
  end
end
