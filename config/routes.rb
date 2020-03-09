Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  root 'home#top'
  get 'home/about' => 'home#about'
  resources :books do
  	resources :book_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  get 'follows' => 'users#follows'
  get 'followers' => 'users#followers'
 end
