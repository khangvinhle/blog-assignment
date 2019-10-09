# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      omniauth_callbacks: 'users/omniauth_callbacks',
      registrations: 'users/registrations'
  }
  root 'home#index'

  resources :posts do
    resource :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
