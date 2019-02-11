Rails.application.routes.draw do
  root to: 'users#landing'

  get 'users/landing', to: 'users#landing'
  get 'users/personal', to: 'users#personal', as: :user

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions'
  }

  resources :travels
  resources :notes, except: [:new] do
    get 'personal', on: :collection
  end
  resources :cards, except: [:index]
  resources :lists, except: [:new] do
    get 'personal', on: :collection
  end

  get '/lists/:id/:travel_id/duplicate', to: 'lists#duplicate', as: :duplicate_list

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
