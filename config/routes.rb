Rails.application.routes.draw do
  root 'home#top'
  get "home/about" => "home#about"
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update] do
  		get :following, on: :member
      get :followers, on: :member
  end
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resources :post_comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
end