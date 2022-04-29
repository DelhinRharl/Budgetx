# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'users#index'
  get '/users', to: 'users#index'

  resources :categories
  resources :expenses
end
