Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :trips do
    resources :to_transports
    resources :there_transports
    resources :hotels
    resources :ratings, only: [:create]
  end
end
