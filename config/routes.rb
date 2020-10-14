Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :users, only: [:show]
  resources :posts, only: [:new, :create, :show, :edit, :update, :destroy]
end
