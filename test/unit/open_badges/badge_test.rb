require 'test_helper'

module OpenBadges
  class BadgeTest < ActiveSupport::TestCase
    fixtures :all

    setup do
      @android_badge = open_badges_badges(:android)
      @ios_badge = open_badges_badges(:ios)
    end
    
    test "badge attributes must not be empty" do
      badge = Badge.new
      assert badge.invalid?
      assert badge.errors[:name].any?
      assert badge.errors[:image].any?
    end

    def new_badge(image_url)
      Badge.new(name: "Windows",
                image: image_url)
    end

    test "paperclip attachment and removal" do
      missing_path = "/open_badges/missing.png"
      image_path = File.join(Rails.root, "/app/assets/Smiley_face.png")

      # Start by asserting image is empty
      assert_equal missing_path, @android_badge.image.url(), "Image not empty"

      # Attach an image
      image = File.open(image_path)
      @android_badge.update_attributes(:image => image)

      # Assert image is no longer missing
      assert_not_equal missing_path, @android_badge.image.url(), "Image file not attached"

      # Remove uploaded file
      @android_badge.destroy
    end

    test "badge name must be unique" do
      badge = Badge.new(name: @android_badge.name)
      assert !badge.save
      assert_equal I18n.translate('activerecord.errors.messages.taken'),
                   badge.errors[:name].join('; ')
    end

    test "destroys all associated badge_tag when badge is destroyed" do
      assert_difference 'BadgeTag.count', -2 do
        @ios_badge.destroy
      end
    end

    test "destroys all associated badge_alignment when badge is destroyed" do
      assert_difference 'BadgeAlignment.count', -2 do
        @ios_badge.destroy
      end
    end

    test "destroys all associated assertions when badge is destroyed" do
      assert_difference 'Assertion.count', -1 do
        @android_badge.destroy
      end
    end
  end
end
