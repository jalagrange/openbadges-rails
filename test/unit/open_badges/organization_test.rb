require 'test_helper'

module OpenBadges
  class OrganizationTest < ActiveSupport::TestCase

    test "organization attributes must not be empty" do
      organization = Organization.new
      assert organization.invalid?
      assert organization.errors[:url].any?
      assert organization.errors[:name].any?
    end
  end
end
