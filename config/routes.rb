Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :catalogs, only: [:index, :show]
  resources :books
  get '/', to: 'home#index'
end
