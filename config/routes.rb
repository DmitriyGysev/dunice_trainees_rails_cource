Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'user/registrations' }
  root to: 'phrases#index', as: :root

  resources :phrases do
    member do
      post :vote
    end
    resources :examples, only: [:create, :destroy] do
      post :vote
    end
  end

  resources :users, only: [:show, :index]
  get 'static_pages/hello'

end
