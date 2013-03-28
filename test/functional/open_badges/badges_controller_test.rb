require 'test_helper'

module OpenBadges
  class BadgesControllerTest < ActionController::TestCase

    setup do
      @badge = open_badges_badges(:android)
    end

    def json
      ActiveSupport::JSON.decode @response.body
    end
  
    # test "should get index" do
    #   get :index
    #   assert_response :success
    #   assert_not_nil assigns(:badges)
    # end
  
    # test "should get new" do
    #   get :new
    #   assert_response :success
    # end
  
    # test "should create badge" do
    #   assert_difference('Badge.count') do
    #     post :create, badge: { criteria: @badge.criteria, description: @badge.description, image: @badge.image, name: @badge.name }
    #   end
  
    #   assert_redirected_to badge_path(assigns(:badge))
    # end
  
    test "should show badge json" do
      get :show, id: @badge, :format => "json"
      assert_response :success

      json = JSON.parse response.body
      assert_equal json["name"], "Android"
      assert_equal json["image"], "android.jpg"
      assert_equal json["description"], %{A Linux-based operating system designed primarily for touchscreen mobile devices such as smartphones and tablet computers}
      
      tags = json["tags"]
      assert_not_nil tags
      assert_equal tags.length, 3

      alignments = json["alignment"];
      assert_not_nil tags
      assert_equal tags.length, 3
      assert_equal json["issuer"], "http://localhost:3000/open_badges/organization.json"
    end
  
    # test "should get edit" do
    #   get :edit, id: @badge
    #   assert_response :success
    # end
  
    # test "should update badge" do
    #   put :update, id: @badge, badge: { criteria: @badge.criteria, description: @badge.description, image: @badge.image, name: @badge.name }
    #   assert_redirected_to badge_path(assigns(:badge))
    # end
  
    # test "should destroy badge" do
    #   assert_difference('Badge.count', -1) do
    #     delete :destroy, id: @badge
    #   end
  
    #   assert_redirected_to badges_path
    # end
  end
end
