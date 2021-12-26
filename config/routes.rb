Rails.application.routes.draw do
  devise_for :admins

  devise_for :user,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }

  root "user/communities#index"

  scope module: :user do
    resources :users,only: [:show, :index, :edit, :update]
    resources :accounts, only: [:index, :create, :edit, :update, :destroy]
    resources :communities 
    resources :community_comments, only: [:create, :edit, :update, :destroy], as: :community_comments
    
  end



end