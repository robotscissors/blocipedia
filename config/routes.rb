Rails.application.routes.draw do

  root 'welcome#index'
  resources :wikis

  devise_for :users
  resources :charges, only: [:new, :create]
  
end
