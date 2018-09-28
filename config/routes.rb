Rails.application.routes.draw do
  get 'friendships/create'

  get 'friendships/update'

  get 'friendships/destroy'

  get 'landing/index'

  get 'messages/create'

  devise_for :users, controllers: { registrations: 'users/registrations'}

  resources :users, only: :show do
    resources :user_groups, only: [:new, :create, :destroy, :index]
    resources :user_books, only: [:create, :new, :destroy, :show]
  end

  resources :groups, only: :show do 
    resources :user_groups, only: [:index, :show]
  end

  resources :messages, only: [:index, :create, :destroy]

  resources :books, only: [:index, :show] do 
    resources :book_groups, only: [:index, :new, :create, :destroy, :show]
  end 

  resources :friendships, only: [:create, :update, :destroy]

  resources :ratings, only: :create do
    collection do
      get 'rating'
    end
  end

  get :autocomplete, controller: :main

  get :search, controller: :main

  get :user_autocomplete, controller: :main

  get :user_search, controller: :main

  get '/users/sign_out' => 'devise/sessions#destroy'

  get '/search' => 'main#search'

  get '/my_profile' => 'users#show', as: :user_root

  root 'landing#index'

  mount ActionCable.server, at: '/cable'


end
