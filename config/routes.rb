Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/about', to: 'pages#about'
  get '/price', to: 'pages#price'
  get '/blog', to: 'blogs#index'
  get '/contact', to: 'contact#index'
end
