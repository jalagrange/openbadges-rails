class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  # GET /
  def index
    respond_to do |format|
      format.html { redirect_to open_badges_url }
	end
  end
end
