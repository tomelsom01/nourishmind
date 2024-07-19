# config/routes.rb
Rails.application.routes.draw do
  # Devise routes for user and admin authentication
  devise_for :users

  # Root path
  root to: "pages#home"

  # Static pages
  get '/about', to: 'pages#about'
  get '/price', to: 'pages#price'
  get '/blog', to: 'blogs#index'
  get '/contact', to: 'contact_forms#index'

  # Blog routes
  resources :blogs, only: [:index, :show]

  # Contact form routes
  resources :contacts
  resources :contact_forms, only: [:new, :create]

  # Booking routes
  get '/booking', to: 'bookings#index'

  # Yoga class routes
  resources :yoga_classes do
    resources :bookings
  end

  # User namespace
  namespace :users do
    get 'dashboard', to: 'dashboard#index'
  end

  # Admin namespace
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    resources :yoga_classes do
      resources :users, only: [:index, :new, :create, :edit, :update, :destroy]
    end
  end
end
