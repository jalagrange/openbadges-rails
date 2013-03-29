require 'test_helper'

module OpenBadges
  class OrganizationsControllerTest < ActionController::TestCase
    setup do
      @organization = open_badges_organizations(:smart)
    end
  
    # test "should get index" do
    #   get :index
    #   assert_response :success
    #   assert_not_nil assigns(:organizations)
    # end

    test "should show organization json" do
      get :show, id: @badge, :format => "json"
      assert_response :success

      json = JSON.parse response.body
      assert_equal json["url"], "http://smart-academy.com", "Url Invalid"
      assert_equal json["name"], "Smart Academy", "Name Invalid"
      assert_equal json["email"], "smart-academy@gmail.com", "Email Invalid"
      assert_equal json["description"], "Provide Smart Courses", "Description Invalid"
    end
  
    # test "should get new" do
    #   get :new
    #   assert_response :success
    # end
  
    # test "should create organization" do
    #   assert_difference('Organization.count') do
    #     post :create, organization: { description: @organization.description, email: @organization.email, image: @organization.image, name: @organization.name, url: @organization.url }
    #   end
  
    #   assert_redirected_to organization_path(assigns(:organization))
    # end
  
    # test "should show organization" do
    #   get :show, id: @organization
    #   assert_response :success
    # end
  
    # test "should get edit" do
    #   get :edit, id: @organization
    #   assert_response :success
    # end
  
    # test "should update organization" do
    #   put :update, id: @organization, organization: { description: @organization.description, email: @organization.email, image: @organization.image, name: @organization.name, url: @organization.url }
    #   assert_redirected_to organization_path(assigns(:organization))
    # end
  
    # test "should destroy organization" do
    #   assert_difference('Organization.count', -1) do
    #     delete :destroy, id: @organization
    #   end
  
    #   assert_redirected_to organizations_path
    # end
  end
end
