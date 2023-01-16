Rails.application.routes.draw do
  root "cabs#index"
  resources :cabs do
    resources :bookings
  end
  resources :users
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


end