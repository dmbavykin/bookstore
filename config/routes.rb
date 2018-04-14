# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount ShoppyCartus::Engine => '/shoppy_cartus', as: 'shoppy_cartus'
  root 'home#index'
  resources :categories, only: %i[index show]
  resources :books, only: :show do
    resources :reviews, only: :create
  end
  resources :users, only: :edit
  resources :addresses, only: %i[create update]
end
