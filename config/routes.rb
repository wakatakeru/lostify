Rails.application.routes.draw do
  root to: 'home#index'

  get 'home/index'

  resources :property do
    get 'download', on: :member
    get 'destroy_reporting', on: :member
  end

  resources :lost

  devise_for :users
end
