require 'test_helper'

module OpenBadges
  class OrganizationsControllerTest < ActionController::TestCase
    fixtures :all
    
    setup do
      @organization = open_badges_organizations(:smart)
    end

    test "access for user who is not signed in" do
      get :show, format: :html
      assert_response :redirect, "get index should not be allowed"
      
      post :create
      assert_response :redirect, "post create should not be allowed"

      get :show, id: @organization, format: :json
      assert_response :success, "get organization json should be allowed"
    end

    test "access for user who is signed in" do
      sign_in User.first

      get :show, format: :html
      assert_response :success, "get index should be allowed"

      post :create, id: @organization
      assert_redirected_to organization_path

      get :show, id: @organization, format: :json
      assert_response :success, "get organization json should be allowed"
    end

    test "should show organization json" do
      get :show, id: @badge, :format => "json"
      assert_response :success

      json = JSON.parse response.body
      assert_equal "http://smart-academy.com", json["url"], "Url Invalid"
      assert_equal "Smart Academy", json["name"], "Name Invalid"
      assert_equal "smart-academy@gmail.com", json["email"], "Email Invalid"
      assert_equal "Provide Smart Courses", json["description"], "Description Invalid"
    end
  end
end
