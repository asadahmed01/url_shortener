class ApplicationController < ActionController::Base

  def set_link
    @link = Link.find(params[:id])
  end

  def authenticate_user
    Current.user ||= User.find_by(id: session[:user_id])
  end

  def is_user_authenticated?
    Current.user.present?
  end

  def login(user)
    user.touch :last_sign_in_at
    session[:user_id] = user.id
    Current.user = user
  end

  def logout
    session[:user_id] = nil
    Current.user = nil
  end
end
