Rails.application.routes.draw do
  root "cheeses#index"

  resources :cheeses
end
