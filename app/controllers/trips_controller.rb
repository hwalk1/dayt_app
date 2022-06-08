class TripsController < ApplicationController

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to trip_dayts_path(@trip)
    else
      render :new
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def itinerary
    @trip = Trip.find(params[:trip_id])
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :location, :distance, :date)
  end
end
