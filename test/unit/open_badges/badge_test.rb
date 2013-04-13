require 'test_helper'

module OpenBadges
  class BadgeTest < ActiveSupport::TestCase
    fixtures :all
    include AttachmentHelper

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

      # Start by asserting image is empty
      assert_equal MISSING_IMAGE_URL, @android_badge.image.url(), "Image not empty"

      # Attach an image
      @android_badge.update_attributes(:image => File.open(SMILEY_IMAGE_PATH))

      # Assert image is no longer missing
      assert_not_equal MISSING_IMAGE_URL, @android_badge.image.url(), "Image file not attached"

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
