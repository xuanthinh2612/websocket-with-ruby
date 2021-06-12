Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  #
  resources :sessions, except: :new
  resources :messages
  root 'chatroom#index'
  get 'login', to: 'sessions#new'

  mount ActionCable.server, at: '/cable'
end
