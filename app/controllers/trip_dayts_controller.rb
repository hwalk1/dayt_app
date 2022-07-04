class TripDaytsController < ApplicationController
  # This Trip Dayts controller is our join table for linking trips with many dayts and linking a dayt with many trips.
  def index
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @trip_dayt = TripDayt.new(trip_dayt_params)
    # The trip from the trip dayt is assigned to the trip.
    @trip_dayt.trip = @trip
    @trip_dayt.save
    @tags = params[:trip_dayt][:tags].split
    # This is the logic where we have trips plucked near the params location & distance, which is then ordered.
    @dayts = Dayt.where.not(id: @trip.dayts.pluck(:id)).near(@trip.location, @trip.distance).order(id: :asc)
    # This check is to filter our which dayt is given to the user, and that the tags are present.
    @dayts = @dayts.tagged_with(@tags, any: true) if params[:trip_dayt][:tags].present?
    # This then maps the id's of each dayt as a title
    @ids = @dayts.map { |dayt| dayt.title }
    # Our dayt stack presented to the user is 5 cards
    @dayt = @dayts[5]
    respond_to do |format|
      # This is the formatting for which view is shown to the user.
      if @dayt
        format.html { redirect_to trip_dayts_path(@trip) }
        format.text { render partial: "dayts/slide", locals: { trip: @trip, dayt: @dayt, tags: @tags }, formats: [:html] }
      else
        format.html { redirect_to trip_dayts_path(@trip) }
        format.text { render partial: "dayts/delete", formats: [:html] }
      end
    end
  end

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
