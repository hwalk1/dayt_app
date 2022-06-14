Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/journey', to: 'pages#journey', as: 'journey'
  get '/trips/:trip_id/itinerary', to: 'trips#itinerary', as: 'itinerary'
  patch '/trips/:trip_id/update_all', to: 'trip_dayts#update_all', as: "update_all_trip_dayts"
  get '/mydayts', to: 'dayts#mydayts', as: 'mydayts'


  resources :trips, only: [:new, :create, :show, :update, :index, :destroy] do
    resources :dayts, only: [:index]
    resources :trip_dayts, only: [:create]
    resources :mass_reviews, only: [:new, :create]
  end

  resources :dayts, only: [:new, :create, :show, :edit, :update, :destroy]

  resources :trip_dayts, only: [:delete]

end
