Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }
  root to: 'pages#home'

  get 'users/:id' => 'users#show', as: :show_user

  get 'spots/search', to: 'spots#search', as: :search_spot

  resources :spots do
    resources :bookings, only: [ :new, :create]
  end

  resources :bookings, only: [:index, :show, :edit, :update] do
    resources :reviews, only: [:new, :create]
  end

  resources :messages ,only: [:index, :new, :create]
end
