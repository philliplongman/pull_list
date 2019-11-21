Rails.application.routes.draw do

  devise_for :managers

  namespace :admin do
    resources :areas
    resources :brands
    resources :managers
    resources :placements
    resources :products
    resources :sections
    resources :sizes

    root to: "managers#index"
  end

  root "homes#index"

end
