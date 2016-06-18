Rails.application.routes.draw do

  get 'boards/new'

  get 'boards/edit'

  root 'boards#index'

  resources :boards
  resources :sessions, only: [:new, :create, :destroy]
  get 'log_out', :to => 'sessions#destroy', :as => 'log_out'
end
