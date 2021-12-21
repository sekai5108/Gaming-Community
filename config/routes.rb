Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  
  
  root "homes#top"
  
  resources :users
  resources :communties
  resources :accounts
end
