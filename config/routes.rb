Rails.application.routes.draw do

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get  '/login',   to: 'sesions#new'
  post   '/login',   to: 'sesions#create'
  delete '/logout',  to: 'sesions#destroy'
  resources :users
  resources :account_activations
  resources :password_resets
  resources :microposts
  namespace :admin do
    resources :users, except: [:index, :show]
    resources :microposts, except: [:index, :show]
  end
end
