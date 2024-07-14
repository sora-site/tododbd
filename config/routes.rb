Rails.application.routes.draw do
  devise_for :users

  root "projects#index"
  
  resources :projects, only: [:index,:show ,:new, :create, :destroy] do
    resources :tasks, only: [:destroy] do
      resources :tasks, only: [:edit]
    end
  end

end
