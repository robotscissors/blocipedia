Rails.application.routes.draw do

  root 'welcome#index'
  resources :wikis
  resources :collaborators, only: [:create, :destroy]


  devise_for :users
  resources :charges, only: [:new, :create]
  resources :user_upgrades, only: [:edit]
  resources :user_downgrades, only: [:edit]
end
