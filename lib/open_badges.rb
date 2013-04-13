require "open_badges/engine"

module OpenBadges
  class << self

    mattr_accessor :user_class
    @@user_class = nil

    mattr_accessor :current_user
  	@@current_user = ''

  	mattr_accessor :is_openbadges_admin
  	@@is_openbadges_admin = ''

    # setup user config
    def setup
      yield self
    end

    # Issues a badge
    #
    # user_id    - Integer
    # user_email - String
    # badge_id   - Integer
    # bake_badge - Boolean
    # params     - Hash of optional parameters.
    #   :issued_on  - DateTime (or any valid DateTime string), default = now.
    #   :evidence   - String
    #   :expires    - DateTime (or any valid DateTime string)
    #
    # returns a hash
    #   :success - Boolean
    #   :assertion_id - Integer
    #   :error - String
    #     ERROR_INVALID_BADGE
    #     ERROR_ASSERTION_EXIST
    #
    # example:
    # OpenBadges::issue(@user_id, @user_email, @badge.id, false, {
    #     issued_on: DateTime.new(2025, 3, 29),
    #     evidence: "Some Evidence",
    #     expires: DateTime.new(2025, 3, 29)})
    public
    def issue(user_id, user_email, badge_id, bake_badge = true, params = {})

      result = {}
      result[:success] = false

      assertion = OpenBadges::Assertion.new(
        user_id: user_id,
        badge_id: badge_id,
        evidence: params[:evidence],
        expires: params[:expires])
      assertion.created_at = params[:issued_on]
      assertion.setIdentity user_email

      if assertion.valid?
        if bake_badge
          assertion.image = File.open assertion.badge.image.path
        end
        assertion.save

        result[:assertion_id] = assertion.id
        result[:success] = true;
      else
        if assertion.errors[:badge].any?
          result[:error] = "ERROR_INVALID_BADGE"

        elsif assertion.errors[:user_id].include? "assertion exists"
          result[:error] = "ERROR_ASSERTION_EXIST"
        end
      end

      Rails.logger.info("result: " + result.to_s)

      return result
    end
  end
end
