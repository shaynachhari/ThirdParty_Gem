Rails.application.routes.draw do
  resources :accounts
  post"auth/login", to:"authentication#login"

  # post '/social_accounts', to: 'social_accounts#create'
    resources :social_accounts


end
