require 'test_helper'

module OpenBadges
  class AlignmentsControllerTest < ActionController::TestCase
    fixtures :all

    setup do
      @alignment = open_badges_alignments(:engin)
    end

    test "access for user who is not signed in" do
      get :index
      assert_response :redirect, "get index should not be allowed"
      
      get :new
      assert_response :redirect, "get new should not be allowed"
      
      get :edit, id: @alignment
      assert_response :redirect, "get edit should not be allowed"
      
      post :create
      assert_response :redirect, "post create should not be allowed"
      
      put :update, id: @alignment
      assert_response :redirect, "put update should not be allowed"

      assert_difference('Alignment.count', 0, "alignment deletion should not be allowed") do
        delete :destroy, id: @alignment
      end
    end

    test "access for user who is signed in" do
      sign_in User.first

      get :index
      assert_response :success, "get index should be allowed"
      
      get :new
      assert_response :success, "get new should be allowed"
      
      get :edit, id: @alignment
      assert_response :success, "get edit should be allowed"
      
      post :create
      assert_response :success, "post create should be allowed"
      
      put :update, id: @alignment
      assert_redirected_to alignments_path, "put update should be allowed"

      assert_difference('Alignment.count', -1, "alignment deletion should be allowed") do
        delete :destroy, id: @alignment
      end
      assert_redirected_to alignments_path, "should redirect to alignment page after deletion"
    end
  end
end
