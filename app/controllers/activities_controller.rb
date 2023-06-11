class ActivitiesController < ApplicationController
  def show
    @trip = Trip.find(params[:trip_id])
    @booked_activity = Activity.find(params[:id])
    @activity_booking = ActivityBooking.new

    booked_activities_ids = Activity.where(trip_id: @trip.id).map { |ba| ba.id }
    activity_bookings_day_ids = ActivityBooking.where(activity_id: booked_activities_ids).map { |ab| ab.day_id }
    @days = Day.where(trip_id: @trip.id) - Day.where(id: activity_bookings_day_ids)
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @activity = Activity.new
    @booked_activities = Activity.where(trip_id: @trip.id)
    @activity_booking = HotelBooking.new
  end

  def create
    @activity = Activity.new(activity_params)
    @trip = Trip.find(params[:trip_id])
    @activity.trip = @trip
    if @activity.save
      redirect_to new_trip_activity_path(@trip), notice: "ok"
    else
      render :new, status: :unprocessable_entity, notice: "didn't work"
    end
  end

  def edit
    @trip = Trip.find(params[:trip_id])
    @activity = Activity.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:trip_id])
    @activity = Activity.find(params[:id])
    @activity.update(activity_params)
    redirect_to new_trip_activity_path(@trip), notice: "Activity modified!"
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :duration, :address, :price_person, :comment)
  end
end
