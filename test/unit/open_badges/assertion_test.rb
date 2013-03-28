require 'test_helper'
require 'date'

module OpenBadges
  class AssertionTest < ActiveSupport::TestCase

    setup do
      @android_badge = open_badges_badges(:android)
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
  end
end
