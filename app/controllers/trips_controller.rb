class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :itinerary]

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

  def edit
    @trip = Trip.find(params[:id])
  end

  def index
    @next_trips = Trip.where(user_id: current_user, date: Date.today..).order(date: :desc)
    @past_trips = Trip.where(user_id: current_user, date: ...Date.today).order(date: :desc)
  end

  def show
    @trip = Trip.find(params[:id])
    @dayts = Dayt.includes(trip_dayts: :trip).where(trip_dayts: { status: "accepted", trip: @trip })
    @trip_dayts = @trip.trip_dayts.where(status: "accepted").order(:order)
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
    @trip_dayts = @trip.trip_dayts.where(status: "accepted")
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

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :location, :distance, :date, tag_list: [])
  end
end
