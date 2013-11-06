class Ability
  include CanCan::Ability

  def initialize(user)
    admin ||= Admin.new # guest user (not logged in)
    if admin
      can :manage, User
      can :manage, Club
      can :manage, Player
    end
  end
end
