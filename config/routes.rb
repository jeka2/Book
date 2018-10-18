Rails.application.routes.draw do

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
    resources :chapters, only: [:index, :show]
    resources :chapter_groups, only: [:index, :new, :create, :destroy, :show]
  end 

  resources :friendships, only: [:create, :update, :destroy]

  resources :ratings, only: :create do
    collection do
      get 'rating'
    end
  end

  resources  :descriptions, only: [:create, :update]

  resources :administrative, only: [:index, :create, :destroy]

  resources :privacy, only: [:create, :destroy]

  resources :memberships, only: [:create, :destroy]

  get :autocomplete, controller: :main

  get :search, controller: :main

  get :user_autocomplete, controller: :main

  get :user_search, controller: :main

  get '/descriptions/button' => 'descriptions#button', as: :description_button

  get '/users/sign_out' => 'devise/sessions#destroy'

  get '/search' => 'main#search'

  get '/profile/:id' => 'users#show', as: :user_root

  root 'landing#index'

  mount ActionCable.server, at: '/cable'


end
