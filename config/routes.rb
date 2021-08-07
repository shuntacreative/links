Rails.application.routes.draw do
  devise_for :users,
    controllers: { 
      registrations: 'registrations',
      sessions: :sessions
    } 
  root 'home#index'

  resources :users, only: [:show, :index]

  resources :reactions, only: [:create]

  resources :matching, only: [:index]
  resources :chat_rooms, only: [:create, :show]
end
