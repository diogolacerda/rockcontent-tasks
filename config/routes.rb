Rails.application.routes.draw do

  root 'boards#index'

  resources :boards
  resources :sessions, only: [:new, :create, :destroy]
  get 'log_out', :to => 'sessions#destroy', :as => 'log_out'
end
