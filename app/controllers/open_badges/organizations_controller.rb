require_dependency "open_badges/application_controller"

module OpenBadges
  class OrganizationsController < ApplicationController

    # GET /organization
    def show
      @organization = Organization.first

      if @organization.nil?
        @organization = Organization.create
      end

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @organization }
      end
    end
  
    # POST /organization
    def create
      @organization = Organization.first

      if @organization.nil?
        @organization = Organization.create
      end

      respond_to do |format|
        if @organization.update_attributes(params[:organization])
          format.html { redirect_to :back, :flash => { :success => 'Organization was successfully updated.' } }
        else
          format.html { redirect_to :back, :flash => { :error => 'Organization was not successfully updated.' } }
        end
      end
    end
  end
end
