require 'test_helper'

module OpenBadges
  class OrganizationTest < ActiveSupport::TestCase
    fixtures :all
    include AttachmentHelper

    setup do
      @organization = open_badges_organizations(:smart)
    end

    test "organization attributes must not be empty" do
      organization = Organization.new
      assert organization.invalid?
      assert organization.errors[:url].any?
      assert organization.errors[:name].any?
    end

    test "paperclip attachment and removal" do

      # Start by asserting image is empty
      assert_equal MISSING_IMAGE_URL, @organization.image.url(), "Image not empty"

      # Attach an image
      @organization.update_attributes(:image => File.open(SMILEY_IMAGE_PATH))

      # Assert image is no longer missing
      assert_not_equal MISSING_IMAGE_URL, @organization.image.url(), "Image file not attached"

      # Remove uploaded file
      @organization.destroy
    end
  end
end
