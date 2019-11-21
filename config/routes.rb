Rails.application.routes.draw do

  namespace :admin do
    resources :managers
    resources :areas
    resources :brands
    resources :products
    resources :sections
    resources :sizes

    root to: "managers#index"
  end

  devise_for :managers

  root "homes#index"

end
