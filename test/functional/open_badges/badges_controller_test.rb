require 'test_helper'

module OpenBadges
  class BadgesControllerTest < ActionController::TestCase
    fixtures :all

    setup do
      @badge = open_badges_badges(:android)
    end

    def json
      ActiveSupport::JSON.decode @response.body
    end

    test "access for user who is not signed in" do
      get :index
      assert_response :redirect, "get index should not be allowed"
      
      get :new
      assert_response :redirect, "get new should not be allowed"
      
      get :edit, id: @badge
      assert_response :redirect, "get edit should not be allowed"
      
      post :create
      assert_response :redirect, "post create should not be allowed"
      
      put :update, id: @badge
      assert_response :redirect, "put update should not be allowed"

      get :show, id: @badge, format: :json
      assert_response :success, "get badge json should be allowed"

      assert_difference('Badge.count', 0, "badge deletion should not be allowed") do
        delete :destroy, id: @badge
      end
    end

    test "access for user who is signed in" do
      sign_in User.first

      get :index
      assert_response :success, "get index should be allowed"
      
      get :new
      assert_response :success, "get new should be allowed"
      
      get :edit, id: @badge
      assert_response :success, "get edit should be allowed"
      
      post :create
      assert_response :success, "post create should be allowed"
      
      put :update, id: @badge
      assert_response :success, "put update should be allowed"

      get :show, id: @badge, format: :json
      assert_response :success, "get badge json should be allowed"

      assert_difference('Badge.count', -1, "badge deletion should be allowed") do
        delete :destroy, id: @badge
      end
      assert_redirected_to badges_path, "should redirect to badge page after deletion"
    end
  
    test "badge json validity" do
      # Attach image file
      image_path = File.join(Rails.root, "/app/assets/Smiley_face.png")
      image = File.open(image_path)
      @badge.update_attributes(:image => image)

      get :show, id: @badge, :format => "json"
      assert_response :success

      json = JSON.parse response.body
      assert_equal "Android", json["name"], "Name invalid"
      assert_not_nil json["image"], "Image invalid"
      assert_not_nil json["description"], "Description invalid"

      tags = json["tags"]
      assert_not_nil tags , "Tags invalid"
      assert_equal 3, tags.length, "Tags length invalid"

      alignments = json["alignment"];
      assert_not_nil alignments, "Alignments invalid"
      assert_equal 1, alignments.length, "Alignments length invalid"

      assert_equal "http://localhost:3000/open_badges/organization.json",
        json["issuer"],
        "Issuer invalid"
      
      @badge.destroy
    end
  end
end
