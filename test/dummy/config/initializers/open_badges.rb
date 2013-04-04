OpenBadges.setup do |config|

  # User class to be awarded badges

  config.user_class = User

  # Helper function in ActionController::Base to get current user
  # Returns user object if a user is logged in, nil otherwise
  #
  # If you are using devise then ignore this section
  # Otherwise extend using ActiveSupport::Concern (uncomment below and implement TODO)
  #
  # module OpenBadgesActionControllerExtension extend ActiveSupport::Concern
  #   def current_user
  #     # TODO: return user object if a user is logged in, nil otherwise
  #   end
  # end
  # ActionController::Base.send(:include, OpenBadgesActionControllerExtension)

  config.current_user = 'current_user'

  # Helper function in user model to determine if user has permission to openbadges panel
  # Returns true if user has access, false otherwise
  #
  # Add to the user class directly or extend using ActiveSupport::Concern (uncomment below and implement TODO)
  #
  module OpenBadgesUserExtension extend ActiveSupport::Concern
  	# TODO: return true if user has access, false otherwise. e.g. return self.is_admin?
    def is_openbadges_admin?
      return true # accessible by every user!
    end
  end
  config.user_class.send(:include, OpenBadgesUserExtension)

  config.is_openbadges_admin = 'is_openbadges_admin?'

end
