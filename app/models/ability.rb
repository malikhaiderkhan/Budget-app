class Ability
  include CanCan::Ability

  def initialize(user)
    user || User.new # Guest user

    # if user.admin?
    can :manage, :all
    # else
    can :read, :all
    # Define other abilities based on user roles
    # end
  end
end
