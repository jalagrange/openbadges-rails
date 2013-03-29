require 'test_helper'

module OpenBadges
  class AssertionsControllerTest < ActionController::TestCase
    setup do
      @assertion = open_badges_assertions(:androidAssertion)
    end
  
    # test "should get index" do
    #   get :index
    #   assert_response :success
    #   assert_not_nil assigns(:assertions)
    # end
  
    # test "should get new" do
    #   get :new
    #   assert_response :success
    # end
  
    # test "should create assertion" do
    #   assert_difference('Assertion.count') do
    #     post :create, assertion: { badge_id: @assertion.badge_id, evidence: @assertion.evidence, expires: @assertion.expires, identity: @assertion.identity, identity_hashed: @assertion.identity_hashed, identity_salt: @assertion.identity_salt, identity_type: @assertion.identity_type, image: @assertion.image, issued_on: @assertion.issued_on, verification_type: @assertion.verification_type, verification_url: @assertion.verification_url }
    #   end
  
    #   assert_redirected_to assertion_path(assigns(:assertion))
    # end

    test "should show assertion json" do
      get :show, id: @assertion, :format => "json"
      assert_response :success

      json = JSON.parse response.body
      assert_equal json["badge"], "http://localhost:3000/open_badges/badges/1.json"

      recipient = json["recipient"]
      assert_not_nil recipient, "Json not found"
      assert_equal recipient["identity"], "sha256$", "Identity invalid"
      assert_equal recipient["type"], "email", "Identity type invalid"
      assert_equal recipient["salt"], "ABC", "Identity salt invalid"
      assert_equal recipient["hashed"], true, "Identity hashed invalid"

      recipient = json["verify"]
      assert_not_nil recipient, "Recipient invalid"
      assert_equal recipient["url"], "http://localhost:3000/open_badges/assertions/1.json", "Recipient url invalid"
      assert_equal recipient["type"], "hosted", "Recipient type invalid"

      assert_equal json["evidence"], "Some Evidence", "Evidence invalid"
      assert_equal json["expires"], DateTime.parse("2001-01-01 01:01:01").to_i, "Expires invalid"
    end
  
    # test "should show assertion" do
    #   get :show, id: @assertion
    #   assert_response :success
    # end
  
    # test "should get edit" do
    #   get :edit, id: @assertion
    #   assert_response :success
    # end
  
    # test "should update assertion" do
    #   put :update, id: @assertion, assertion: { badge_id: @assertion.badge_id, evidence: @assertion.evidence, expires: @assertion.expires, identity: @assertion.identity, identity_hashed: @assertion.identity_hashed, identity_salt: @assertion.identity_salt, identity_type: @assertion.identity_type, image: @assertion.image, issued_on: @assertion.issued_on, verification_type: @assertion.verification_type, verification_url: @assertion.verification_url }
    #   assert_redirected_to assertion_path(assigns(:assertion))
    # end
  
    # test "should destroy assertion" do
    #   assert_difference('Assertion.count', -1) do
    #     delete :destroy, id: @assertion
    #   end
  
    #   assert_redirected_to assertions_path
    # end
  end
end
