Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  resources :daily_digests

  get '/auth/twitter', as: :sign_in
  get '/auth/failure', to: 'sessions#failure'
  get 'auth/add_email', to: 'sessions#add_email'
  post 'auth/update_email', to: 'sessions#update_email'
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/auth/:provider/callback', to: 'sessions#create'
end
