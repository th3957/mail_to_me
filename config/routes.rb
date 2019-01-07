Rails.application.routes.draw do
  root to: 'travels#index'

  devise_for :users, controllers: {
    registrations:'users/registrations'
  }

  resources :users, only: [:show]
  resources :travels

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
