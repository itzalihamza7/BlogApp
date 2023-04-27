# frozen_string_literal: false

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  scope module: 'readers' do
    resources :home, only: %i[show]
    resources :posts, only: %i[show] do
      resources :suggestions, only: %i[index create update destroy]
      resources :comments, only: %i[create update destroy]
    end
  end

  namespace :authors do
    resources :posts do
      resources :elements, only: %i[create update destroy]
      resources :stats, only: %i[index]
    end
  end

  resources :likes, only: %i[create destroy]
  resources :reports, only: %i[create destroy]
  resources :users, only: %i[index show]

  root to: 'readers/home#index'
end
