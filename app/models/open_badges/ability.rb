module OpenBadges
  class Ability
    include CanCan::Ability

    def initialize(user)
      user ||= OpenBadges.user_class.new

      if user.send(OpenBadges.is_openbadges_admin)
        can :manage, :all
      else
        can :json, OpenBadges::Badge
        can :json, OpenBadges::Assertion
        can :json, OpenBadges::Organization
      end
    end
  end
end
