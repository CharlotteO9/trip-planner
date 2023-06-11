Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :trips do
    resources :to_transports, only: [:new, :create]
    resources :there_transports, only: [:new, :create]
    resources :hotels, only: [:new, :create, :show, :destroy, :edit, :update] do
      resources :hotel_bookings, only: [:new, :create]
    end
    resources :activities, only: [:new, :create, :show, :destroy, :edit, :update] do
      resources :activity_bookings, only: [:new, :create]
    end
    resources :food_drinks, only: [:new, :create]
    resources :ratings, only: [:create]
  end

end
