OpenBadges.setup do |config|

  # user class to be awarded badges
  config.user_class = User

  # helper function in ActionController::Base to get current user
  # if using devise then this part is already done
  # otherwise use ActiveSupport::Concern or monkey patch
  # http://stackoverflow.com/questions/2328984/rails-extending-activerecordbase
  config.current_user = 'current_user'

  # helper function in user model to determine if user has permission to openbadges panel
  # return true if user has access, false otherwise
  #
  # The following example allows all app admins to access the panel
  #
  # class User < ActiveRecord::Base
  #   def is_openbadges_admin?
  #    return self.is_admin
  #   end
  # end
  #
  config.is_openbadges_admin = 'is_openbadges_admin?'

end