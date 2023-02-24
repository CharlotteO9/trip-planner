class ToTransportsController < ApplicationController
  def create
    @transport_to = ToTransport.new(to_transport_params)
    @transport_to.trip = Trip.find(params[:trip_id])
    if @transport_to.save
      redirect_to trip_path(@trip), notice: "ok" #CA NE MARCHE PAS LA !!!
    else
      render "trips/show", status: :unprocessable_entity, notice: "didn't work"
    end
  end

  private

  def to_transport_params
    params.require(:to_transport).permit(:variety, :price_person)
  end
end
