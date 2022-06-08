class TripsController < ApplicationController

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    @trip.save
    redirect_to trip_dayts_path(@trip)
  end

  def show
  end

  def itinerary
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :location, :distance, :date)
  end
end
