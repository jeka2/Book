Rails.application.routes.draw do

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
    resources :chapters, only: [:index, :show]
    resources :chapter_groups, only: [:index, :new, :create, :destroy, :show]
  end 

  resources :friendships, only: [:create, :update, :destroy]

  resources :ratings, only: :create do
    collection do
      get 'rating'
    end
  end

  resources :bans, only: [:index, :create, :destroy]

  resources  :descriptions, only: [:create, :update]

  resources :administrative, only: [:index, :create, :destroy]

  resources :privacy, only: [:create, :destroy]

  resources :memberships, only: [:create, :destroy]

  get :autocomplete, controller: :main

  get :search, controller: :main

  get :user_autocomplete, controller: :main

  get :user_search, controller: :main

  get '/friendships/panel' => 'friendships#panel', as: :friendships_panel

  get 'landing/index'

  get 'messages/create'

  get 'bans/search' => 'bans#search', as: :bans_search

  get '/bans/list' => 'bans#list', as: :bans_list

  get '/descriptions/button' => 'descriptions#button', as: :description_button

  get '/users/sign_out' => 'devise/sessions#destroy'

  get '/search' => 'main#search'

  get '/users/:id' => 'users#show', as: :user_root

  root 'landing#index'

  mount ActionCable.server, at: '/cable'


end
