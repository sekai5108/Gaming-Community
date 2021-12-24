Rails.application.routes.draw do
  devise_for :admins

  devise_for :user,skip: [:passwords,], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }

  scope module: :user do
    resources :users,only: [:show, :index, :edit, :update]
    resources :accounts, only: [:index, :create, :edit, :update, :destroy]
    resources :communities
  end



end