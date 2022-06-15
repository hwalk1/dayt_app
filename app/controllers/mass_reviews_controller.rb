class MassReviewsController < ApplicationController

  def new
    @trip = Trip.find(params[:trip_id])
    @trip.trip_dayts.each do |trip_dayt|
      @trip.reviews.build(trip_dayt: trip_dayt) unless @trip.reviews.exists?(trip_dayt_id: trip_dayt.id)
    end
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @trip.assign_attributes(reviews_params)
    if @trip.reviews.all?(&:save)
      redirect_to trips_path
    else
      render :new
    end
  end


  private

  def reviews_params
    params.require(:trip).permit(reviews_attributes:[:recommended, :rating, :busy, :trip_dayt_id])
  end
end
