Rails.application.routes.draw do
  root 'static_pages#first'
  get  '/home',   to: 'static_pages#home'
  get  '/about',  to: 'static_pages#about'
  get  '/signup', to: 'users#new'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
