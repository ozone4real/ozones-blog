class UsersController < ApplicationController
  before_action :require_user, only: %i(profile update_profile_img)

  def signup_user
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully signed up to Ozone's blog"
      payload = { id: @user.id, username: @user.username }
      token = JsonWebToken.encode(payload)
      session[:token] = token
      json_response({ user: @user, token: token }, :created)
    else
      json_response(@user.errors, :conflict)
    end
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      flash[:success] = "Successfully logged in"
      payload = { id: user.id, username: user.username }
      token = JsonWebToken.encode(payload)
      puts token
      session[:token] = token
      json_response({ user: user, token: token }, 200)
    else
      json_response({ message: "Invalid email or password" }, 401)
    end
  end

  def logout_user
    session[:token] = nil
    redirect_to root_path
  end

  def profile
    @user = User.find(current_user[:id])
  end

  def edit_profile
    @user = User.update(current_user[:id], params.permit(:full_name, :bio))
    if @user.save
      flash[:success] = "Profile successfully updated"
    else
      flash[:danger] = @user.errors.full_messages
      render 'profile'
    end
  end

  def update_profile_img
    @user = User.update(current_user[:id], params.permit(:image_url))
    if !@user.save
      json_response({ message: "image upload error" }, 400)
    else
      json_response({ user: @user }, 200)
    end
  end

  def user_params
    params.permit(:username, :email, :password)
  end
end
