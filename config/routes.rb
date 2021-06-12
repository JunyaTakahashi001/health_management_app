Rails.application.routes.draw do
  namespace :users do
    resources :healths
  end

  namespace :admins do
    resources :healths
    resources :personal_healths
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
