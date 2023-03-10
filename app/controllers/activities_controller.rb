class ActivitiesController < ApplicationController
  def new
    @trip = Trip.find(params[:trip_id])
    @activity = Activity.new
    @booked_activities = Activity.where(trip_id: @trip.id)
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

  private

  def activity_params
    params.require(:activity).permit(:title, :duration, :address, :price_person, :comment)
  end
end
