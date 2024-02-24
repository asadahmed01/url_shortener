class LoginsController < ApplicationController

  def show
    user = User.find_by_token_for(:magic_link, params[:token])

    login(user) if user.present?
    redirect_to root_path
  end

  def destroy
    logout
    redirect_to root_path
  end
end
