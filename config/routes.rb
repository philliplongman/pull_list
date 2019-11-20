Rails.application.routes.draw do

  devise_for :managers

  root "homes#index"

end
