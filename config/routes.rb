Rails.application.routes.draw do
  get 'static/index'
  root 'static#index'

  resources :runs
  resources :read_groups
end
