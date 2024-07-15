Rails.application.routes.draw do
  devise_for :users

  root "projects#index"
  
  resources :projects, only: [:index ,:new, :create, :destroy, :edit, :update] 
end
