class LoginsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def show
    user = User.find_by_token_for(:magic_link, params[:token])
    if user.present?
      login(user)
      redirect_to root_path
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
end
