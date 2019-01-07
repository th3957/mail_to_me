Rails.application.routes.draw do
  root to: 'travels#index'

  devise_for :users, skip: :all

  resources :travels
end
