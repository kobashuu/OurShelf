Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#first'
  get  '/home',   to: 'static_pages#home'
  get  '/about',  to: 'static_pages#about'
  get  '/signup', to: 'users#new'
  get  '/welcome', to: 'static_pages#welcome'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
