Rails.application.routes.draw do
  devise_for :admins, controllers: {
    namespace :admins do
      resources :healths
    end

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
