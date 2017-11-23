Rails.application.routes.draw do
  get 'home/index'
  resources :property do
    get 'download', on: :member
  end
  
  devise_for :users
end
