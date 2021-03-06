Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#index'
  get 'contact', to: 'pages#contact'
  get 'about', to: 'pages#about'

  namespace :dashboard do
    root to: 'pages#index'
    resources :posts
    resources :users, only: :index
  end

  resources :posts
end
