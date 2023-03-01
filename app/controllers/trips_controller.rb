class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    i = @trip.day
    if @trip.save
      until i.zero?
        Day.create!(
          number: i,
          trip: @trip
        )
        i -= 1
      end
      redirect_to new_trip_to_transport_path(@trip)
    else
      render :new, status: :unprocessable_entity, notice: "didn't work"
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :destination, :number_people, :day, :start_date, :end_date, :photo)
  end
end
