class LoginsController < ApplicationController
  #before_action :require_login, only: [:destroy]

  def new
    @user = User.new
  end


  def show
    @user = User.find_by_token_for(:magic_link, params[:token])
    if @user.present?
      login(@user)
      redirect_to root_path, notice: "You have successfully logged in!"
    end
  end

  def create
    @user = User.find_or_create_by(email: user_params[:email])
    if @user.save  
      # Send an email with the magic link to the user's email address
      UserMailer.send_magic_link(@user).deliver_now
  
      redirect_to root_path, notice: "Login link sent to #{@user.email}! Check your inbox."
    else
      flash.now[:alert] = "There was a problem creating an account or sending the login link."
      render :new, status: 422
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

  private

  def require_login
    unless is_user_authenticated?
      redirect_to login_path, alert: "You need to log in to access this page."
    end
  end


  def user_params
    params.permit(:email)
  end

end
