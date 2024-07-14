Rails.application.routes.draw do
  devise_for :users

  root "projects#index"
  
  resources :projects, only: [:index,:show ,:new, :create] do
    resources :tasks, only: [:delete] do
      resources :tasks, only: [:edit]
    end
  end

end
