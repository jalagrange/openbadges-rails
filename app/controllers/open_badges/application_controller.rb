module OpenBadges
  class ApplicationController < ActionController::Base

  	# GET /
    def show
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
