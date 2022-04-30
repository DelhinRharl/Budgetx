class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, :all
    if user.admin? :admin
      can :manage, :all
    else
      can :manage, Category, user_id: user.id
      can :manage, Expense, user_id: user.id
      can :read, :all
    end
  end
end
