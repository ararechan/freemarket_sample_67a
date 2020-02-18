Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources "posts", only: [:index]
  resources :card, only: [:index]
  resources :card, only: [:new] do
    collection do
      get 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end


  resources "products", only: [:index, :new] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources "categorys", only: [:index]
  resources 'users', only: [:show]
  get '/logout', to: "users#logout"
  resources "signup", only: [:index, :create]

  resources :purchases, only: [:index, :show] do
    collection do
      post 'pay', to: 'purchases#pay'
      get 'done', to: 'purchases#done'
    end
    member do
      get 'confirm'
    end
  end


end