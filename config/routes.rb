# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'users#index'
  get '/users', to: 'users#index'

   devise_scope :user do
    authenticated :user do
      root :to => "categories#index", as: :authenticated_root
      get '/users/sign_out' => 'devise/sessions#destroy'
    end
    unauthenticated :user do
      root :to => "user#index", as: :unauthenticated_root
    end
  end

  resources :categories
  resources :expenses
end
