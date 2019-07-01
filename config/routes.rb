Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :items, only: [:index, :show]
  resources :orders

  namespace :admin do
    resources :items
    resources :users, only: [:index]
    resources :orders, only: [:index]
  end
end
