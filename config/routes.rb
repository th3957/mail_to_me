Rails.application.routes.draw do
  root to: 'users#top'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions'
  }

  resource :user, only: [:show]
  resource :user do
    get 'top', on: :collection
  end
  resources :travels
  resources :notes, except: [:new]
  resources :cards, except: [:index]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
