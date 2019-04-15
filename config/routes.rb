Rails.application.routes.draw do
  devise_for :users
  root to: "todo_lists#index"

  resources :todo_lists
  resources :users, except: :new

  get "pending", to: "todo_lists#pending"
  get "completed", to: "todo_lists#completed"
end
