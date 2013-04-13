require 'test_helper'
require 'date'

module OpenBadges
  class AssertionTest < ActiveSupport::TestCase
    fixtures :all
    include AttachmentHelper

    setup do
      @android_badge = open_badges_badges(:android)
      @android_assertion = open_badges_assertions(:androidAssertion)
    end

    test "assertion attributes must not be emtpy" do
      assertion = Assertion.new
      assert assertion.invalid?
      assert assertion.errors[:badge_id].any?
      assert !assertion.errors[:identity].any? 
      assert !assertion.errors[:identity_hashed].any?
      assert !assertion.errors[:identity_type].any?
      assert !assertion.errors[:verification_type].any?
    end

    test "assertion must reference a valid badge" do
      assertion = Assertion.new(badge_id: @android_badge.id)
      assert assertion.save

      assertion = Assertion.new(badge_id: 99)
      assert assertion.invalid?
    end

    test "paperclip attachment and removal" do

      # Start by asserting image is empty
      assert_equal MISSING_IMAGE_URL, @android_assertion.image.url(), "Image not empty"

      # Attach an image
      image = File.open(SMILEY_IMAGE_PATH)
      @android_assertion.update_attributes(:image => image)

      # Assert image is no longer missing
      assert_not_equal MISSING_IMAGE_URL, @android_assertion.image.url(), "Image file not attached"

      # Remove uploaded file
      @android_assertion.destroy
    end

    test "attached image is baked" do

      # Start by asserting image is empty
      assert_equal MISSING_IMAGE_URL, @android_assertion.image.url(), "Image not empty"

      # Attach an image
      image = File.open(SMILEY_IMAGE_PATH)
      @android_assertion.update_attributes(:image => image)

      # Assert image is no longer missing
      assert_not_equal MISSING_IMAGE_URL, @android_assertion.image.url(), "Image file not attached"

      png = ChunkyPNG::Image.from_file(@android_assertion.image.path)
      assert (png.metadata.has_key? Assertion::OPENBADGES_METADATA_KEY), "Image not baked"

      # Remove uploaded file
      @android_assertion.destroy
    end
  end
end
