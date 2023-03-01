class ToTransportsController < ApplicationController
  def new
    @trip = Trip.find(params[:trip_id])
    @transport_to = ToTransport.new
  end

  def create
    @transport_to = ToTransport.new(to_transport_params)
    @trip = Trip.find(params[:trip_id])
    @transport_to.trip = @trip
    if @transport_to.save
      redirect_to new_trip_there_transport_path(@trip), notice: "ok"
    else
      render :new, status: :unprocessable_entity, notice: "didn't work"
    end
  end

  private

  def to_transport_params
    params.require(:to_transport).permit(:variety, :price_person)
  end
end
