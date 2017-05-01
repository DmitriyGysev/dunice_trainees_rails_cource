Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'user/registrations' }
  root to: 'phrases#index', as: :root

  resources :phrases do
    resources :examples, only: [:create, :destroy]
  end

  resources :users, only: [:show, :index]
  get 'static_pages/hello'

end
