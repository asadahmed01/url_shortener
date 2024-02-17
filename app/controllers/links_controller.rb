class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound do
    redirect_to root_path, alert: "link not found."
  end
  def index
    @links = Link.recent_first
    @link ||= Link.new
  end

  def show
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.turbo_stream { render turbo_stream: turbo_stream.prepend("links", @link)}
      end
    else
      index
      render :index, status: unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @link.update(link_params)
      redirect_to @link, notice: "link has been successfully updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @link.destroy
    redirect_to root_path, notice: "link has been removed."
  end


  private
  def link_params
    params.require(:link).permit(:url)
  end
end
