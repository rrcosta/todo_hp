Rails.application.routes.draw do
  devise_for :users

  resources :todo_lists
  resources :users
end
