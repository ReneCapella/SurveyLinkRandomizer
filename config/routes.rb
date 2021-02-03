Rails.application.routes.draw do
  resources :surveys
  get 'surveys/new'
  get 'surveys/index'
  get 'surveys/edit'
  get 'surveys/update'
  get 'surveys/destroy'
  get 'surveys/create'

  resources :users, only: [:new, :create, :show] do
    resources :participants
  end
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'


end
