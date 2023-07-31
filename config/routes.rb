Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "homes/about", to: "homes#about", as: "about"
  # resources :homes
  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments , only: [:create, :destroy]
  end
  # get 'users/show'
  # get 'users/edit'
  resources :users, only: [:show, :edit, :update]
end
