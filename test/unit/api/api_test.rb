require 'test_helper'
require 'date'

module OpenBadges
  class ApiTest < ActiveSupport::TestCase

    setup do
      image_path = File.join(Rails.root, "/app/assets/Smiley_face.png")
      @badge = OpenBadges::Badge.create(
        name: 'Api',
        image: File.open(image_path),
        criteria: 'http://some.criteria.com',
        description: 'some description')

      @user_id = 2
      @user_email = 'a@b.c'
    end

    teardown do
      @badge.destroy
    end

    test "badge issued successfully" do
      result = OpenBadges::issue(@user_id, @user_email, @badge.id, {
        issued_on: DateTime.new(2025, 3, 29),
        evidence: "Some Evidence",
        expires: DateTime.new(2025, 3, 29)})

      assert_not_nil result, 'result is nil'
      assert result[:success], 'issuing not successful'
      assert_not_nil result[:assertion_id], 'assertion_id is nil'
      assert_nil result[:error], 'error is not nil'

      assertion = Assertion.find(result[:assertion_id])
      assert assertion.image, 'baked image does not exist'

      baked_image = ChunkyPNG::Image.from_file(assertion.image.path)
      assert (baked_image.metadata.has_key? Assertion.OPENBADGES_METADATA_KEY),
        "Image not baked"
    end

    test "do not issue the same badge again" do
      result = OpenBadges::issue(@user_id, @user_email, @badge.id, {
        issued_on: DateTime.new(2025, 3, 29),
        evidence: "Some Evidence",
        expires: DateTime.new(2025, 3, 29)})

      assert_not_nil result, 'result is nil'
      assert result[:success], 'issuing not successful'
      assert_not_nil result[:assertion_id], 'assertion_id is nil'
      assert_nil result[:error], 'error is not nil'

      result = OpenBadges::issue(@user_id, @user_email, @badge.id, {
        issued_on: DateTime.new(2025, 3, 29),
        evidence: "Some Evidence",
        expires: DateTime.new(2025, 3, 29)})

      assert_not_nil result, 'result is nil'
      assert !result[:success], 'issuing should not be successful'
      assert_nil result[:assertion_id], 'assertion_id should be nil'
      assert_equal "ERROR_ASSERTION_EXIST", result[:error], 'should have error'
    end

    test "issue badge without optional parameters" do
      result = OpenBadges::issue(@user_id, @user_email, @badge.id)

      assert_not_nil result, 'result is nil'
      assert result[:success], 'issuing not successful'
      assert_not_nil result[:assertion_id], 'assertion_id is nil'
      assert_nil result[:error], 'error is not nil'
    end
  end
end