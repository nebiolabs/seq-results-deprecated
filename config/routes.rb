Rails.application.routes.draw do
  root 'static#index'

  resources :runs, only: [:index, :show, :update]
end
