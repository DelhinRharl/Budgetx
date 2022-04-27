Rails.application.routes.draw do

  devise_for :users
  get '/', to: 'users#index'
  get '/users', to: 'categories#index'

    resources :categories do
      resources :expenses
    end
end
