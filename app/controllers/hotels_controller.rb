class HotelsController < ApplicationController
  def show
    @trip = Trip.find(params[:trip_id])
    @booked_hotel = Hotel.find(params[:id])
    @hotel_booking = HotelBooking.new

    booked_hotels_ids = Hotel.where(trip_id: @trip.id).map { |bh| bh.id }
    hotel_bookings_day_ids = HotelBooking.where(hotel_id: booked_hotels_ids).map { |hb| hb.day_id }
    @days = Day.where(trip_id: @trip.id) - Day.where(id: hotel_bookings_day_ids)
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @hotel = Hotel.new
    @booked_hotels = Hotel.where(trip_id: @trip.id)
    @hotel_booking = HotelBooking.new
  end

  def create
    @hotel = Hotel.new(hotel_params)
    @trip = Trip.find(params[:trip_id])
    @hotel.trip = @trip
    if @hotel.save
      redirect_to new_trip_hotel_path(@trip), notice: "ok"
    else
      render :new, status: :unprocessable_entity, notice: "didn't work"
    end
  end

  def edit
    @trip = Trip.find(params[:trip_id])
    @hotel = Hotel.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:trip_id])
    @hotel = Hotel.find(params[:id])
    @hotel.update(hotel_params)
    redirect_to new_trip_hotel_path(@trip), notice: "Hotel modified!"
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy
  end

  private

  def hotel_params
    params.require(:hotel).permit(:name, :address, :price_night_person, :breakfast)
  end
end
