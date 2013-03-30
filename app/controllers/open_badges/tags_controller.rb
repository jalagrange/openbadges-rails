require_dependency "open_badges/application_controller"

module OpenBadges
  class TagsController < ApplicationController
    load_and_authorize_resource :class => 'OpenBadges::Tag'

    # GET /tags
    # GET /tags.json
    def index
      @tags = Tag.all
  
      respond_to do |format|
        format.html # index.html.erb
      end
    end
  
    # GET /tags/new
    def new
      @tag = Tag.new
  
      respond_to do |format|
        format.html # new.html.erb
      end
    end
  
    # GET /tags/1/edit
    def edit
      @tag = Tag.find(params[:id])
    end
  
    # POST /tags
    def create
      @tag = Tag.new(params[:tag])
  
      respond_to do |format|
        if @tag.save
          format.html { redirect_to tags_url, :flash => { :success => 'Tag was successfully created.' } }
        else
          format.html {
            flash[:error] = @tag.errors.full_messages
            render action: "new"
          }
        end
      end
    end
  
    # PUT /tags/1
    def update
      @tag = Tag.find(params[:id])
  
      respond_to do |format|
        if @tag.update_attributes(params[:tag])
          format.html { redirect_to tags_url, :flash => { :success => 'Tag was successfully updated.' } }
        else
          format.html {
            flash[:error] = @tag.errors.full_messages
            render action: "edit"
          }
        end
      end
    end
  
    # DELETE /tags/1
    def destroy
      @tag = Tag.find(params[:id])
      @tag.destroy
  
      respond_to do |format|
        format.html { redirect_to tags_url, :flash => { :success => 'Tag was successfully deleted.' } }
      end
    end
  end
end
