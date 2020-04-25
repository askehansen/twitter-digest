Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  resources :daily_digests
  resource :user

  get '/', to: 'home#index', as: :sign_in
  get '/auth/twitter', as: :sign_in_twitter
  post '/sign_out', to: 'sessions#destroy', as: :sign_out
  get '/auth/failure', to: 'sessions#failure'
  get 'auth/add_email', to: 'sessions#add_email'
  post 'auth/update_email', to: 'sessions#update_email'
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/auth/:provider/callback', to: 'sessions#create'
end
