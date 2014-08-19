Rails.application.routes.draw do
  get 'static/index'
  root 'static#index'

  resources :runs
end
