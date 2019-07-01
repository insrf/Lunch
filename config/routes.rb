Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'menus#index'
  resources :menus, only: [:index, :show]
  resources :orders

  namespace :admin do
    resources :menus
    resources :users, only: [:index]
    resources :orders, only: [:index]
  end
end
