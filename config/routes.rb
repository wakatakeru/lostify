require 'sidekiq/web'

Rails.application.routes.draw do

  root to: 'home#index'

  get 'home/index'

  resources :property do
    get 'download', on: :member
    get 'destroy_reporting', on: :member
  end

  resources :lost

  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == 'hoge' && password == 'hogehoge'
  end
  mount Sidekiq::Web => '/sidekiq'
  
  devise_for :users
end
