class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new, status: :unprocessable_entity, notice: "didn't work"
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @transport_to = ToTransport.new
    @transport_there = ThereTransport.new
    @hotel = Hotel.new
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :destination, :number_people, :day, :start_date, :end_date, :photo)
  end
end
