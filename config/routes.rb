Rails.application.routes.draw do

  root 'boards#index'

  resources :users

  resources :boards
  put 'tasks/:id/change_status/:task_status_id', :to => "tasks#change_status", :as => "change_task_status"
  resources :sessions, only: [:new, :create, :destroy]
  get 'log_out', :to => 'sessions#destroy', :as => 'log_out'
end
