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
      can :create, Review, user_id: user.id
      can %i[read confirm], Order, user_id: user.id
      can %i[create update], Address, addressable_type: 'User', addressable_id: user.id
      can %i[create update], CreditCard, user_id: user.id
    end
  end
end
