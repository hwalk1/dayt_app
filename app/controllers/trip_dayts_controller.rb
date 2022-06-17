class TripDaytsController < ApplicationController
  def index
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @trip_dayt = TripDayt.new(trip_dayt_params)
    @trip_dayt.trip = @trip
    @trip_dayt.save
    @dayts = Dayt.where.not(id: @trip.dayts.pluck(:id)).near(@trip.location, @trip.distance).order(id: :asc)
    @dayts = @dayts.tagged_with( @trip.tag_list.join(', '), any: true) if @trip.tag_list.any?

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

  # def save_extended_card
  #   @trip = Trip.find(params[:trip_id])
  #   @trip_dayt = TripDayt.new(trip_dayt_params)
  #   @trip_dayt.trip = @trip
  #   @trip_dayt.save
  # end

  def destroy
  end

  def remove
    @trip_dayt = TripDayt.find(params[:id])
    @trip_dayt.declined!
    @trip_dayt.save
    @trip = @trip_dayt.trip
    redirect_to itinerary_path(@trip)
  end

  def update_all
    @trip = Trip.find(params[:trip_id])
    params[:dayt_ids]&.each_with_index do |id, index|
      TripDayt.find(id).update!(order: index)
    end
    # @trip.trip_dayts.where(status: "accepted", id: params[:dayt_ids]).each_with_index do |trip_dayt, index|
    #   trip_dayt.update!(order: [index])
    # end
    redirect_to trip_path(@trip)
  end

  private

  def trip_dayt_params
    params.require(:trip_dayt).permit(:dayt_id, :status)
  end
end
