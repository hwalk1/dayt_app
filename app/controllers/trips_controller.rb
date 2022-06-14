class TripsController < ApplicationController
  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to trip_dayts_path(@trip, tags: params[:trip][:search_tags])
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def index
    @trips = Trip.where(user_id: current_user)
  end

  def show
    @trip = Trip.find(params[:id])
    @dayts = Dayt.includes(trip_dayts: :trip).where(trip_dayts: { status: "accepted", trip: @trip }).order("trip_dayts.order")
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
<<<<<<< HEAD
<<<<<<< Updated upstream
=======
    @trip_dayts = @trip.trip_dayts.where(status: "accepted")
    # @total_time = @dayts.sum(:duration).to_f
>>>>>>> Stashed changes
=======
    # @total_time = @dayts.sum(:duration).to_f
>>>>>>> be4504b699166998c5aed331ecee6fb1919d4b3a
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

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :location, :distance, :date)
  end
end
