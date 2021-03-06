Rails.application.routes.draw do
  devise_for :admin

  devise_for :user,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }

  root "user/communities#index"

  scope module: :user do
    resources :users,only: [:show, :index, :edit, :update]
    resources :accounts, only: [:index, :create, :edit, :update, :destroy]
    resources :communities do
      resources :community_comments, only: [:create, :edit, :update, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
  end



end