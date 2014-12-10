Rails.application.routes.draw do
  root 'home#index'

  resources :elements, only: [:index]
end
