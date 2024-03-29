Rails.application.routes.draw do
  # Devise is used for logins & user mangement.
  devise_for :users
  # All page logic it can also be found by running rails routes to see full routing
  root to: 'pages#home'
  get '/journey', to: 'pages#journey', as: 'journey'
  get '/trips/:trip_id/itinerary', to: 'trips#itinerary', as: 'itinerary'
  patch '/trips/:trip_id/update_all', to: 'trip_dayts#update_all', as: "update_all_trip_dayts"
  get '/mydayts', to: 'dayts#mydayts', as: 'mydayts'
  get '/tagged', to: "dayts#tagged", as: :tagged
  patch '/trip_dayt/:id/remove', to: 'trip_dayts#remove', as: 'remove_trip_dayt'
  # get '/dayts/:trip_id', to: 'trip_dayts#save_extended_card', as: 'save_extended_card'

# Nested dayts, trip dayts & mass reviews as they all belong to a trip.
  resources :trips, only: [:new, :create, :show, :update, :index, :destroy] do
    resources :dayts, only: [:index]
    resources :trip_dayts, only: [:create]
    resources :mass_reviews, only: [:new, :create]
  end

  resources :dayts, only: [:new, :create, :show, :edit, :update, :destroy]

  resources :trip_dayts, only: [:delete]

end
