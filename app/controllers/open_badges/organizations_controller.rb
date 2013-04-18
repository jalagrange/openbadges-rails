require_dependency "open_badges/application_controller"

module OpenBadges
  class OrganizationsController < ApplicationController
    load_and_authorize_resource :class => 'OpenBadges::Organization'

    # POST /organizations
    def create
      @organization = Organization.new(params[:organization])
  
      respond_to do |format|
        if @organization.save
          format.html { redirect_to organizations_path,
            :flash => { :success => 'Organization was successfully updated.' } }
        else
          format.html { redirect_to organizations_path,
            :flash => { :error => @organization.errors.full_messages } }
        end
      end
    end

    # GET /organizations
    def index
      @organization = Organization.first || Organization.new

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @organization }
      end
    end

    # PUT /organizations
    def update
      @organization = Organization.first || Organization.create

      respond_to do |format|
        if @organization.update_attributes(params[:organization])
          format.html { redirect_to organizations_path,
            :flash => { :success => 'Organization was successfully updated.' } }
        else
          format.html { redirect_to organizations_path,
            :flash => { :error => @organization.errors.full_messages } }
        end
      end
    end
  end
end
