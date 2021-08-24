# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
      resources :managers
      resources :areas
      resources :brands
      resources :placements
      resources :products
      resources :containers
      resources :sizes
      resources :sections

      root to: "managers#index"
    end
  devise_for :managers

  root to: "home#index"
end
