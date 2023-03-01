class HotelBookingsController < ApplicationController
  def create
    @trip = Trip.find(params[:trip_id])
    @hotel_booking = HotelBooking.new(hotel_booking_params)
    @hotel_booking.hotel = Hotel.find(params[:hotel_id])
    if @hotel_booking.save
      redirect_to new_trip_hotel_path(@trip), notice: "ok"
    else
      render :new, status: :unprocessable_entity, notice: "didn't work"
    end
  end

  private

  def hotel_booking_params
    params.require(:hotel_booking).permit(:day_id)
  end
end
