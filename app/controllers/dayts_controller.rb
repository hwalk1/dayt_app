class DaytsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @dayts = Dayt.where.not(id: @trip.dayts.pluck(:id))
    @trip_dayt = TripDayt.new
    @markers = @dayts.geocoded.map do |dayt|
      {
        lat: dayt.latitude,
        lng: dayt.longitude
      }
    end
  end

  def show
    @dayt = Dayt.find(params[:id])

    @markers =
      [{
        lat: @dayt.latitude,
        lng: @dayt.longitude
      }]

    if @dayt.opening_time
      if @dayt.opening_time == 12
        @opening_time = "#{@dayt.opening_time}pm"
      elsif @dayt.opening_time > 12
        @opening_time = "#{@dayt.opening_time - 12}pm"
      else
        @opening_time = "#{@dayt.opening_time}am"
      end
    end

    if @dayt.closing_time
      if @dayt.closing_time == 12
        @closing_time = "#{@dayt.closing_time}pm"
      elsif @dayt.closing_time > 12
        @closing_time = "#{@dayt.closing_time - 12}pm"
      else
        @closing_time = "#{@dayt.closing_time}am"
      end
    end
  end

  def new
    @dayt = Dayt.new
  end

  def create
    @dayt = Dayt.new(dayt_params)
    @dayt.user = current_user
    if @dayt.save
      redirect_to root_path
    else
      render :new
    end
  end

  def remove

  end

  private

  def dayt_params
    params.require(:dayt).permit(
      :title,
      :content,
      :location,
      :duration,
      :price,
      :opening_time,
      :closing_time,
      :booking_url,
      photos: []
    )
  end
end
