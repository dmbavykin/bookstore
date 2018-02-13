Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :catalogs, only: %i[index show]
  resources :books
  get '/', to: 'home#index'
end
