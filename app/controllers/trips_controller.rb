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

  def index
    @trips = Trip.where(user_id: current_user)
  end

  def show
    @trip = Trip.find(params[:id])
    @dayts = Dayt.includes(trip_dayts: :trip).where(trip_dayts: { status: "accepted", trip: @trip })
    unless @dayts.empty?
      @markers = @dayts.geocoded.map do |dayt|
        {
          lat: dayt.latitude,
          lng: dayt.longitude,
          info_window: render_to_string(partial: "shared/info_window", locals: { dayt: dayt }),
          map_marker: render_to_string(partial: "shared/map_marker", locals: { dayt: dayt })
        }
      end
    end
  end

  def itinerary
    @trip = Trip.find(params[:trip_id])
    @dayts = Dayt.includes(trip_dayts: :trip).where(trip_dayts: { status: "accepted", trip: @trip })
    # @total_time = @dayts.sum(:duration).to_f
    unless @dayts.empty?
      @markers = @dayts.geocoded.map do |dayt|
        {
          lat: dayt.latitude,
          lng: dayt.longitude,
          info_window: render_to_string(partial: "shared/info_window", locals: { dayt: dayt }),
          map_marker: render_to_string(partial: "shared/map_marker", locals: { dayt: dayt })
        }
      end
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :location, :distance, :date)
  end
end
