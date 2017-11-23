Rails.application.routes.draw do
  get 'home/index'
  resources :property
  
  devise_for :users
end
