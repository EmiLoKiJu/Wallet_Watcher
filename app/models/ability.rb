class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Group do |group|
      group.user == user
    end
    can :manage, FoundsDrainer do |fd|
      fd.user == user
    end

    can :create, Group
    can :create, FoundsDrainer
  end
end
