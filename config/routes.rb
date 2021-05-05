Rails.application.routes.draw do
  
  resources :boxes do
    resources :items
  end
  namespace :box do
    resources :items
  end

  resources :accounts do
    post '/invite', to: 'relations#invite_user'
    get '/invite', to: 'relations#index'
  end
  devise_for :users, :controllers => { :registrations => 'registrations' }
  root to: 'home#index'
  resources :customer_portal_sessions, only: [:create]
  resources :webhooks
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
