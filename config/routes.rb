Rails.application.routes.draw do
  resources :accounts do
    post '/invite', to: 'relations#invite_user'
    get '/invite', to: 'relations#index'
  end
  devise_for :users
  root to: 'home#index'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
