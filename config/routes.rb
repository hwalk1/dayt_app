Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/journey', to: 'pages#journey', as: 'journey'
  get '/trips/:trip_id/itinerary', to: 'trips#itinerary', as: 'itinerary'

  resources :trips, only: [:new, :create, :show, :update, :index] do
    resources :dayts, only: [:index]
    resources :trip_dayts, only: [:create]
    resources :mass_reviews, only: [:new, :create]
  end
  resources :dayts, only: [:new, :create, :show]

  resources :trip_dayts, only: [:delete]

end
