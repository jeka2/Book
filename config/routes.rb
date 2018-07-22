Rails.application.routes.draw do
  get 'messages/create'

  devise_for :users, controllers: { registrations: 'users/registrations'}

  resources :users do
    resources :groups, only: [:new, :create, :destroy, :show]
    resources :books, only: [:create, :new, :destroy, :show]
  end

  resources :groups, only: [:new, :create, :destroy] do 
    resources :users, only: [:index, :show]
  end

  resources :messages, only: [:index, :create, :destroy]

  resources :books, only: [:index, :show] do 
    resources :groups, only: [:index, :new, :create, :destroy, :show]
  end 



  resources :group_books, only: :index, as: :group_books
  resources :group_books, only: :create, as: :create_group_book
  resources :group_books, only: :new, as: :group_book
  resources :group_books, only: :show, as: :group_book



  resources :user_book, only: :create, as: :create_user_book

  resources :subscribe, only: [:create, :destroy]

  get :autocomplete, controller: :main

  get :search, controller: :main

  get :user_autocomplete, controller: :main

  get :user_search, controller: :main

  get '/users/sign_out' => 'devise/sessions#destroy'

  get '/search' => 'main#search'

  get '/my_profile' => 'users#show', as: :user_root

  get '/dropdown' => 'users#dropdown', as: :user_dropdown

  root 'users#show'

  mount ActionCable.server, at: '/cable'


end
