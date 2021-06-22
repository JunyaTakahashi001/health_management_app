Rails.application.routes.draw do
  namespace :users do
    resources :healths
    resources :actlogs
  end

  namespace :admins do
    resources :healths, only: [:index, :show]
    resources :personal_healths, only: [:index]
  end

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  root to: 'home#index'
end
