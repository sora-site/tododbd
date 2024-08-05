Rails.application.routes.draw do
  devise_for :users

  root "projects#index"
  
  resources :projects, only: [:index ,:new, :create, :destroy, :show]
  resources :things, only: [:edit, :update] 
  resources :spaces, only: [:new, :create, :index] do
    resources :messages, only: [:index, :create]
  end
end