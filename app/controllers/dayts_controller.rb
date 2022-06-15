class DaytsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @dayts = Dayt.where.not(id: @trip.dayts.pluck(:id))
                 .near(@trip.location, @trip.distance)
                 .order(id: :asc)
    @dayts = @dayts.tagged_with(params[:tags], any: true) if params[:tags].present?
    @trip_dayt = TripDayt.new
    @trip_duration = 0
    @trip.dayts.each { |dayt| @trip_duration += dayt.duration }
    @markers = @dayts.geocoded.map do |dayt|
      {
        lat: dayt.latitude,
        lng: dayt.longitude,
        info_window: render_to_string(partial: "shared/info_window", locals: { dayt: dayt }),
        map_marker: render_to_string(partial: "shared/map_marker", locals: { dayt: dayt })
      }
    end
  end

  def show
    @trip = Trip.find(params[:trip]) if params[:trip]
    @trip_dayt = TripDayt.new

    @dayt = Dayt.find(params[:id])

    if @trip
      @distance = Geocoder::Calculations.distance_between([@dayt.latitude, @dayt.longitude], [@trip.latitude, @trip.longitude])
    end

    @markers =
      [{
        lat: @dayt.latitude,
        lng: @dayt.longitude,
        info_window: render_to_string(partial: "shared/info_window", locals: { dayt: @dayt }),
        map_marker: render_to_string(partial: "shared/map_marker", locals: { dayt: @dayt })
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

    #Iterate through each trip_dayt to find matching dayts
    # Select all reviews that have params[:id] == review.trip_dayt.dayt


  end

  def new
    @dayt = Dayt.new
  end

  def create
    @dayt = Dayt.new(dayt_params)
    @dayt.user = current_user
    if @dayt.save
      redirect_to mydayts_path
    else
      render :new
    end
  end

  def destroy
    @dayt = Dayt.find(params[:id])
    @dayt.destroy
    redirect_to mydayts_path
  end

  def mydayts
    @dayts = current_user.dayts
  end

  def edit
    @dayt = Dayt.find(params[:id])
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
      tag_list: [],
      photos: []
    )
  end
end
