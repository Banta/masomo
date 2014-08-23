Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :units, only: [:index, :show] do 
    resources :tests, only: [:index]
    member do
      get :download_resource
    end
  end

  resources :tests, only: [:show] do 
    resources :questions, only: [:index, :show]
    resources :user_tests, only: [:new] do
    end
  end

  root to: 'visitors#index'
end
