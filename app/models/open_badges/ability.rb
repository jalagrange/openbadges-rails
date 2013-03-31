module OpenBadges
  class Ability
    include CanCan::Ability

    def initialize(user, format)
      if user.present? && user.send(OpenBadges.is_openbadges_admin)
        can :manage, :all
      elsif format == 'json'
        can :show, OpenBadges::Badge
        can :show, OpenBadges::Assertion
        can :show, OpenBadges::Organization
      end
    end
  end
end
