Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#home"

  resources :categories, only: [:index, :new, :create, :destroy] do
    resources :exchanges, only: [:index, :new, :create, :destroy]
  end
end
