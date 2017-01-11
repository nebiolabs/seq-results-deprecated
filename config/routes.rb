Rails.application.routes.draw do
  get 'static/index'
  root 'static#index'

  resources :projects, only: [:index]
  resources :runs
  resources :read_groups
  resources :libraries do
    post 'entity', to: 'entity#destroy_all'
  end
end
