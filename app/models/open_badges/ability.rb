module OpenBadges
  class Ability
    include CanCan::Ability

    def initialize(user)
      user ||= OpenBadges.user_class.new

      if user.is_admin?
        can :manage, :all
      else
        can :show, OpenBadges::Badge
        can :json, OpenBadges::Organization
      end
    end
  end
end
