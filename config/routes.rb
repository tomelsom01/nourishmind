Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/about', to: 'pages#about'
  get '/price', to: 'pages#price'
  get '/blog', to: 'blogs#index'
  get '/contact', to: 'contact_forms#index'
  get "/blogs/:id", to: "blogs#show"
  get '/booking', to: 'bookings#index'
  get '/yoga_classes', to: 'yoga_classes#index'

  resources :contacts
  resources :contact_forms, only: [:new, :create]
  resources :blogs, only: [:index, :show]
  resources :users
  resources :yoga_classes do
    resources :bookings
  end
  namespace :admin do
    resources :yoga_classes do
      resources :users, only: [:index, :new, :create, :edit, :update, :destroy]
    end
  end

end
