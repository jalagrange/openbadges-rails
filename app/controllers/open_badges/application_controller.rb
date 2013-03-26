module OpenBadges
  class ApplicationController < ActionController::Base

  	rescue_from CanCan::AccessDenied do |exception|
      redirect_to '/', :flash => { :error => exception.message }
  	end

  	def current_ability
      OpenBadges::Ability.new(current_user)
    end

  	# GET /
    def show
      respond_to do |format|
        format.html # show.html.erb
      end
    end

  end
end
