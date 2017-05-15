Rails.application.routes.draw do

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  devise_for :users, :controllers => { registrations: 'user/registrations' }

  root to: 'phrases#index', as: :root
  get 'static_pages/hello'=> 'static_pages#hello'

  resources :phrases do
    member do
      post :vote
    end
    resources :examples, only: [:create, :destroy] do
      post :vote
    end
  end

  resources :notifications, only: :index do
    collection do
      put :read_all
    end
  end

  resources :users, only: [:show, :index]

  resources :chatrooms

  resources :messages


end
