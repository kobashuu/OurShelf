Rails.application.routes.draw do
  get "information",to: "books#information"
  get "search",     to: "books#search"
  patch "/read",     to: "books#read"
  get 'sessions/new'
  root 'static_pages#home'
  get  '/about',    to: 'static_pages#about'
  get  '/signup',   to: 'users#new'
  get  '/welcome',  to: 'users#welcome'
  get  '/home',     to: 'users#home'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :books, only: [:create, :destroy, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
