Rails.application.routes.draw do
  root to: 'travels#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions'
  }

  resource :user, only: [:show]
  resources :travels
  resources :notes
  resources :cards, except: [:index]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
