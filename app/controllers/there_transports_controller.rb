class ThereTransportsController < ApplicationController
  def new
    @trip = Trip.find(params[:trip_id])
    @transport_there = ThereTransport.new
  end

  def create
    @transport_there = ThereTransport.new(there_transport_params)
    @trip = Trip.find(params[:trip_id])
    @transport_there.trip = @trip
    if @transport_there.save
      redirect_to new_trip_hotel_path(@trip), notice: "ok"
    else
      render :new, status: :unprocessable_entity, notice: "didn't work"
    end
  end

  private

  def there_transport_params
    params.require(:there_transport).permit(:variety, :price_person)
  end
end
