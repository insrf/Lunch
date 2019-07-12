Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'menus#index'
  resources :menus, only: [:index, :show]
  resources :orders

  namespace :admin do
    resources :items
    resources :menus
    resources :users, only: :index
    resources :orders, only: :index do
      get 'showdate', :on => :collection
    end
  end

  namespace 'api' do
    namespace 'v1' do
      resources :orders, only: :index
    end
  end

  use_doorkeeper do
  skip_controllers :authorizations, :applications,
    :authorized_applications
  end
end
