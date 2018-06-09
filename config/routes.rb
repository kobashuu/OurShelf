Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#first'
  get  '/about',    to: 'static_pages#about'
  get  '/signup',   to: 'users#new'
  get  '/welcome',  to: 'users#welcome'
  get  '/home',     to: 'users#home'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users do
    resources :password_digest, controller: 'users/password_digests', :only => :edit
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
