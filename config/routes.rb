Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations'}

  resources :users do
    resources :books, only: [:create, :new, :destroy]
  end

  get '/my_profile' => 'users#show', as: :user_root

  root 'users#show'

end
