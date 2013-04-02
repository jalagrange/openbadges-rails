module OpenBadges
  class ApplicationController < ActionController::Base

  	rescue_from CanCan::AccessDenied do |exception|
      redirect_to '/', :flash => { :error => exception.message }
  	end

  	def current_ability
      OpenBadges::Ability.new(
      	self.respond_to?(OpenBadges.current_user) ? self.send(OpenBadges.current_user) : nil,
      	params[:format]
      )
    end

  	# GET /
    def index
      respond_to do |format|
        format.html # show.html.erb

        # OpenBadges::issue(1, 'a@b.c', 1, {
        #   issued_on: DateTime.new(2025, 3, 29),
        #   evidence: "Some Evidence",
        #   expires: DateTime.new(2025, 3, 29)})
      end
    end
  end
end
