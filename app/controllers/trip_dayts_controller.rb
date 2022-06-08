class TripDaytsController < ApplicationController
  def index
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @trip_dayt = TripDayt.new(trip_dayt_params)
    @trip_dayt.trip = @trip
    @trip_dayt.save
    @dayts = Dayt.where.not(id: @trip.dayts.pluck(:id))
    @dayt = @dayts[5]
    if @dayt
      respond_to do |format|
        format.html { redirect_to trip_dayts_path(@trip) }
        format.text { render partial: "dayts/slide", locals: { trip: @trip, dayt: @dayt }, formats: [:html] }
      end
    else
      redirect_to trip_dayts_path(@trip)
    end
  end

  def destroy
  end

  def trip_dayt_params
    params.require(:trip_dayt).permit(:dayt_id, :status)
  end
end
