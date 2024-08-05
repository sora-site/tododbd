Rails.application.routes.draw do
  devise_for :users

  root "projects#index"
  
  resources :projects, only: [:index ,:new, :create, :destroy, :show] do
    resources :spaces, only: [:new, :create]
  end
  resources :things, only: [:edit, :update] 
end