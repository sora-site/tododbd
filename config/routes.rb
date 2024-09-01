Rails.application.routes.draw do
  devise_for :users

  root "projects#index"
  
  resources :projects, only: [:index ,:new, :create, :destroy, :show]
  resources :things, only: [:edit, :update, :new, :create] 
  resources :spaces, only: [:new, :create, :index, :show]
end