Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'user/registrations' }
  root to: 'phrases#index', as: :root

  resources :phrases, only: [:new, :create, :edit, :update, :destroy]
  resources :users, only: [:show, :index]
  get 'static_pages/hello'

end
