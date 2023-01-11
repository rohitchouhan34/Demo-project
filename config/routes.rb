Rails.application.routes.draw do
  root "users#new"
  resources :cabs do
    resources :bookings
  end
  resources :users
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end