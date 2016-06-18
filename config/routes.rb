Rails.application.routes.draw do

  root 'boards#index'

  resources :sessions, only: [:new, :create, :destroy]
end
