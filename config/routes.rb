Rails.application.routes.draw do
  get '/sign_out_user', to: 'users#sign_out_user', as: 'sign_out_user'
  resources :category_transactions
  resources :money_transactions
  resources :categories
  get 'home/index'
  devise_for :users

  root "home#index"
end
