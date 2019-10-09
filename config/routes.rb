# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: 'accounts', controllers: {
      session: 'users/sessions',
      omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'home#index'
  resources :users do
    resource :posts
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
