class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, :all
    can :manage, OrderItem
    can :manage, Coupon
    if user.admin
      can :manage, :all
    elsif user.confirmed_at
      can :create, Review
      can :manage, Order
      can :create, :update, Address
      can :create, :update, CreditCard
    end
  end
end
