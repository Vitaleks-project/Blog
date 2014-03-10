class Ability
  include CanCan::Ability

  def initialize(user)
    admin ||= Admin.new # guest user (not logged in)
    if admin
      can :manage, User
      can :manage, Club
      can :manage, Player
      can :manage, Game
      can :manage, Season
    end
  end
end
