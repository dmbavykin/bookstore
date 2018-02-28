Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'
  resources :categories, only: %i[index show]
  resources :books, only: :show
  resources :users, only: :edit
  resources :addresses, only: %i[create update]
  resources :reviews, only: :create
  resources :order
  resources :order_items, only: %i[index create destroy]
  resources :coupons, only: %i[create destroy]
end
