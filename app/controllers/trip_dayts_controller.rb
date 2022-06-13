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

    respond_to do |format|
      if @dayt
        format.html { redirect_to trip_dayts_path(@trip) }
        format.text { render partial: "dayts/slide", locals: { trip: @trip, dayt: @dayt }, formats: [:html] }
      else
        format.html { redirect_to trip_dayts_path(@trip) }
        format.text { render partial: "dayts/delete", formats: [:html] }
      end
    end
  end

  def destroy
  end

  def update_all
    @trip = Trip.find(params[:trip_id])
    @trip.trip_dayts.each_with_index do |trip_dayt, index|
      trip_dayt.update(order: params[:dayt_ids][index])
    end
    redirect_to trip_path(@trip)
  end

  private

  def trip_dayt_params
    params.require(:trip_dayt).permit(:dayt_id, :status)
  end
end
