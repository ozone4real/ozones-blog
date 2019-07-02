class UsersController < ApplicationController
  before_action :require_user, only: %i(profile update_profile_img show)
  before_action { @user = current_user }

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

  def show
    @other_user = User.find(params[:id])
    @you_follow_each_other = @user.follow_each_other?(@other_user)
    @follows_you = @user.follows_you?(@other_user)
  end

  def follow_user
    @other_user = User.find(params[:id])
    if @user.is_following?(@other_user)
      @user.unfollow(@other_user)
    else
      @user.follow(@other_user)
    end
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      flash[:success] = "Successfully logged in"
      payload = { id: user.id, username: user.username }
      token = JsonWebToken.encode(payload)
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

  def profile; end

  def edit_profile
    if @user.update(params.permit(:full_name, :bio))
      flash[:success] = "Profile successfully updated"
    else
      flash[:error] = @user.errors.full_messages[0]
      redirect_to profile_path
    end
  end

  def update_profile_img
    if !@user.update(params.permit(:image_url))
      json_response({ message: "image upload error" }, 400)
    else
      user = User.find(current_user[:id])
      p user
      json_response({ user: user }, 200)
    end
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end
end
