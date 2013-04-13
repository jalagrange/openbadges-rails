require 'test_helper'

module OpenBadges
  class AssertionsControllerTest < ActionController::TestCase
    fixtures :all
    
    setup do
      @assertion = open_badges_assertions(:androidAssertion)
    end

    test "access for user who is not signed in" do
      get :index
      assert_response :redirect, "get index should not be allowed"
      
      get :new
      assert_response :redirect, "get new should not be allowed"
      
      get :edit, id: @assertion
      assert_response :redirect, "get edit should not be allowed"
      
      post :create
      assert_response :redirect, "post create should not be allowed"
      
      put :update, id: @assertion
      assert_response :redirect, "put update should not be allowed"

      get :show, id: @assertion, format: :json
      assert_response :success, "get assertion json should be allowed"

      assert_difference('Assertion.count', 0, "assertion deletion should not be allowed") do
        delete :destroy, id: @assertion
      end
    end

    test "access for user who is signed in" do
      sign_in User.first

      get :index
      assert_response :success, "get index should be allowed"
      
      get :new
      assert_response :success, "get new should be allowed"
      
      get :edit, id: @assertion
      assert_response :success, "get edit should be allowed"
      
      post :create
      assert_response :success, "post create should be allowed"
      
      put :update, id: @assertion
      assert_redirected_to assertions_path, "put update should be allowed"

      get :show, id: @assertion, format: :json
      assert_response :success, "get assertion json should be allowed"

      assert_difference('Assertion.count', -1, "assertion deletion should be allowed") do
        delete :destroy, id: @assertion
      end
      assert_redirected_to assertions_path, "should redirect to assertion page after deletion"
    end

    # test "assertion json validity" do
      
    #   # Attach image file
    #   image_path = File.join(Rails.root, "/app/assets/Smiley_face.png")
    #   image = File.open(image_path)
    #   @assertion.update_attributes(:image => image)

    #   get :show, id: @assertion, :format => "json"
    #   assert_response :success

    #   json = JSON.parse response.body
    #   assert_equal json["badge"], "http://localhost:3000/open_badges/badges/1.json"
    #   assert_not_nil json["image"], "Image invalid"

    #   recipient = json["recipient"]
    #   assert_not_nil "Json not found", recipient
    #   assert_equal "sha256$", recipient["identity"], "Identity invalid"
    #   assert_equal "email", recipient["type"], "Identity type invalid"
    #   assert_equal "ABC", recipient["salt"], "Identity salt invalid"
    #   assert_equal true, recipient["hashed"], "Identity hashed invalid"

    #   recipient = json["verify"]
    #   assert_not_nil recipient, "Recipient invalid"
    #   assert_equal "http://localhost:3000/open_badges/assertions/1.json", recipient["url"], "Recipient url invalid"
    #   assert_equal "hosted", recipient["type"], "Recipient type invalid"

    #   assert_equal "Some Evidence", json["evidence"], "Evidence invalid"
    #   assert_equal DateTime.parse("2001-01-01 01:01:01").to_i, json["expires"], "Expires invalid"

    #   @assertion.destroy
    # end
  end
end
