require 'test_helper'

module OpenBadges
  class OrganizationTest < ActiveSupport::TestCase
    fixtures :all

    setup do
      @organization = open_badges_organizations(:smart)
      @missing_path = "/open_badges/missing.png"
      @image_path = File.join(Rails.root, "/app/assets/Smiley_face.png")
    end

    test "organization attributes must not be empty" do
      organization = Organization.new
      assert organization.invalid?
      assert organization.errors[:url].any?
      assert organization.errors[:name].any?
    end

    test "paperclip attachment and removal" do

      # Start by asserting image is empty
      assert_equal @missing_path, @organization.image.url(), "Image not empty"

      # Attach an image
      @organization.update_attributes(:image => File.open(@image_path))

      # Assert image is no longer missing
      assert_not_equal @missing_path, @organization.image.url(), "Image file not attached"

      # Remove uploaded file
      @organization.destroy
    end
  end
end
