Rails.application.routes.draw do
  # get 'home/home'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#home"
  resources :exchanges
  resources :categories
end
