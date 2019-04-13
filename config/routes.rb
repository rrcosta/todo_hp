Rails.application.routes.draw do
  devise_for :users
  root to: 'todo_lists#index'

  resources :todo_lists
  resources :users
end
