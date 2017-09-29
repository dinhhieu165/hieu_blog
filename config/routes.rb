Rails.application.routes.draw do
  get 'sesions/new'

  get 'users/new'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get  '/login',   to: 'sesions#new'
  post   '/login',   to: 'sesions#create'
  delete '/logout',  to: 'sesions#destroy'
  resources :users
end
