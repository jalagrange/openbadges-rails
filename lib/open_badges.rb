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
    # params     - Hash of optional parameters.
    #   :issued_on  - DateTime (or any valid DateTime string), default = now.
    #   :evidence   - String
    #   :expires    - DateTime (or any valid DateTime string)
    #
    # Example
    #
    # issue (1, a@b.c, 2, {
    #   evidence: "Some Evidence",
    #   expires: DateTime.new(2025, 3, 29)})
    #
    public
    def issue(user_id, user_email, badge_id, params = {})

      success = false

      assertion = OpenBadges::Assertion.new(user_id: user_id, badge_id: badge_id)
      assertion.created_at = params[:issued_on]
      assertion.evidence = params[:evidence]
      assertion.expires = params[:expires]

      if assertion.valid?
        assertion.save
        success = true
      end

      Rails.logger.info("Issue success: " << success.to_s)

      #image = ChunkyPNG::Image.from_blob(open(badge.image).read) # maybe can use from url
      #image = ChunkyPNG::Image.from_file(assertion.badge.image) # probably local files only
      #image.metadata['openbadges'] = assertions_url
      #image.to_blob # no save
      #image.save('file.png')

      return success
    end

  end
end
