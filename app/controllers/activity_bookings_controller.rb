class ActivityBookingsController < ApplicationController
  def create
    @trip = Trip.find(params[:trip_id])
    @activity_booking = ActivityBooking.new(activity_booking_params)
    @activity_booking.activity = Activity.find(params[:activity_id])
    if @activity_booking.save
      redirect_to new_trip_activity_path(@trip), notice: "ok"
    else
      render :new, status: :unprocessable_entity, notice: "didn't work"
    end
  end

  private

  def activity_booking_params
    params.require(:activity_booking).permit(:day_id)
  end
end
