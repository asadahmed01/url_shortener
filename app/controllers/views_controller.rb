class ViewsController < ApplicationController

  before_action :set_link # set in the application controller

  def show
    @link.views.create(ip: request.ip, user_agent: request.user_agent)
    redirect_to @link.url, allow_other_host: true
  end

end
