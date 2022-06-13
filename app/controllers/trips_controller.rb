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
    @dayts = Dayt.includes(trip_dayts: :trip).where(trip_dayts: { status: "accepted", trip: @trip }).order("trip_dayts.order")
    unless @dayts.empty?
      @markers = @dayts.geocoded.map do |dayt|
        {
          lat: dayt.latitude,
          lng: dayt.longitude
        }
      end
    end
  end

  def itinerary
    @trip = Trip.find(params[:trip_id])
    @dayts = Dayt.includes(trip_dayts: :trip).where(trip_dayts: { status: "accepted", trip: @trip })
<<<<<<< Updated upstream
=======
    @trip_dayts = @trip.trip_dayts.where(status: "accepted")
    # @total_time = @dayts.sum(:duration).to_f
>>>>>>> Stashed changes
    unless @dayts.empty?
      @markers = @dayts.geocoded.map do |dayt|
        {
          lat: dayt.latitude,
          lng: dayt.longitude
        }
      end
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :location, :distance, :date)
  end
end
