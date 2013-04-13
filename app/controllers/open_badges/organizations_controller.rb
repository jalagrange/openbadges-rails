require_dependency "open_badges/application_controller"

module OpenBadges
  class OrganizationsController < ApplicationController
    load_and_authorize_resource :class => 'OpenBadges::Organization'

    # GET /organization
    def show
      @organization = Organization.first || Organization.new

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @organization }
      end
    end

    # POST /organization
    def create
      @organization = Organization.first || Organization.create

      respond_to do |format|
        if @organization.update_attributes(params[:organization])
          format.html { redirect_to organization_path, :flash => { :success => 'Organization was successfully updated.' } }
        else
          format.html { redirect_to organization_path, :flash => { :error => @organization.errors.full_messages } }
        end
      end
    end
  end
end
