# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user, order)
    user ||= User.new

    can :read, :all
    can :manage, OrderItem, order_id: order.id
    can :manage, Coupon, order_id: order.id
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
