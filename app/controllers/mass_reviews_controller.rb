class MassReviewsController < ApplicationController
# This controller is used to allow for the mass review of individual dayts from a trip
  def new
    @trip = Trip.find(params[:trip_id])
    @trip.trip_dayts.where(status: 'accepted').each do |trip_dayt|
      # A review instance is built for each trip dayt onle if a review doesn;t
      @trip.reviews.build(trip_dayt: trip_dayt) unless @trip.reviews.exists?(trip_dayt_id: trip_dayt.id)
    end
  end

  def create
    @trip = Trip.find(params[:trip_id])
    # .assign_attributed will add the review params listed below to the trip when it is created
    @trip.assign_attributes(reviews_params)
    # &:save will save each review associated with the review,and will return a true if all reviews are saved, so will then redirect to the trip.
    @trip.reviews.each(&:save)
    redirect_to trips_path
  end


  private

  def reviews_params
    params.require(:trip).permit(reviews_attributes:[:recommended, :rating, :busy, :trip_dayt_id])
  end
end
