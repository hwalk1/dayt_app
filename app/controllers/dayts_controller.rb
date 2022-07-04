class DaytsController < ApplicationController

=begin
  A Dayt index is used to select create the stack of cards (Multiple Dayts) that is shown to the user after
  they have selected their preferences tags (Location, Interests, Travel distance & more)
=end

  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    # A trip is created after preferences are confirmed, this is passed in through params
    @trip = Trip.find(params[:trip_id])
    # Dayts selected where not already in the trip, that are near the location & distance, ordered and shown to used
    @dayts = Dayt.where.not(id: @trip.dayts.pluck(:id))
                 .near(@trip.location, @trip.distance)
                 .order(id: :asc)

    # then Dayts are selected if the tags are avialable
    @dayts = @dayts.tagged_with( @trip.tag_list.join(', '), any: true) if @trip.tag_list.any?
    # Reordered and added to a trip.
    @dayts = @dayts.order(id: :asc)
    @trip_dayt = TripDayt.new
    @trip_duration = 0
    @tags = params[:tags]
    # Used for adding up trip_duration bar at the bottom of the page
    
    @trip.trip_dayts.where(status: 'accepted').each { |trip_dayt| @trip_duration += trip_dayt.dayt.duration }
    # Used for mapbox rendering of markers
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
    # Distance calculations to be shown to the user

    if @trip
      @distance = Geocoder::Calculations.distance_between([@dayt.latitude, @dayt.longitude], [@trip.latitude, @trip.longitude])
    end
    # Mapbox Markers
    @markers =
      [{
        lat: @dayt.latitude,
        lng: @dayt.longitude,
        info_window: render_to_string(partial: "shared/info_window", locals: { dayt: @dayt }),
        map_marker: render_to_string(partial: "shared/map_marker", locals: { dayt: @dayt })
      }]
      # Open time logic for calculating if AM, PM should be suffixed on time.
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
