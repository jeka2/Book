Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations'}

  resources :users do
    resources :books, only: [:create, :new, :destroy, :show]
  end

  resources :books, only: [:index, :show]

  get :autocomplete, controller: :main

  get :search, controller: :main

  get '/search' => 'main#search'

  get '/my_profile' => 'users#show', as: :user_root

  get '/dropdown' => 'users#dropdown', as: :user_dropdown

  root 'users#show'

end
