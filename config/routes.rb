Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :users, only: [:show]
  resources :posts, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
end
