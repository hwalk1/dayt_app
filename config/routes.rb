Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/journey', to: 'pages#journey', as: 'journey'
  get '/trips/:trip_id/itinerary', to: 'trips#itinerary', as: 'itinerary'
<<<<<<< HEAD
  patch '/trips/:trip_id/update_all', to: 'trip_dayts#update_all', as: "update_all_trip_dayts"
=======
  get '/mydayts', to: 'dayts#mydayts', as: 'mydayts'
>>>>>>> be4504b699166998c5aed331ecee6fb1919d4b3a


  resources :trips, only: [:new, :create, :show, :update, :index, :destroy] do
    resources :dayts, only: [:index]
    resources :trip_dayts, only: [:create]
    resources :mass_reviews, only: [:new, :create]
  end

<<<<<<< HEAD
  resources :dayts, only: [:new, :create, :show]
  resources :trip_dayts, only: [:delete]

  resources :reviews, only: [:new, :create]
=======
  resources :dayts, only: [:new, :create, :show, :edit, :update, :destroy]

  resources :trip_dayts, only: [:delete]

>>>>>>> be4504b699166998c5aed331ecee6fb1919d4b3a
end
