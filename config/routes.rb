Rails.application.routes.draw do
  get 'chats/show'
  devise_for :users
  root to: 'homes#top'
  get '/home/about' => 'homes#about'

  get "/search", to: "searchs#search"

  get "chat/:id", to: 'chats#show', as: 'chat'
  resources :chats, only: [:create]

  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end