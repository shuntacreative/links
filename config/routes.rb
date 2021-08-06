Rails.application.routes.draw do
  devise_for :users,
    controllers: { 
      registrations: 'registrations',
      sessions: :sessions
    } 
  root 'home#index'

  resources :users, only: [:show, :index]
end
