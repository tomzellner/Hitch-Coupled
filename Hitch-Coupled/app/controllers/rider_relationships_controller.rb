class RiderRelationshipsController < ApplicationController

  def create
    @trip = Trip.find(params[:trip_id])
    @passenger = RiderRelationship.new(passenger_params)
    respond_to do |format|
      if @passenger.save
        format.html {redirect_to @trip}
        format.json { render :json => @passenger }
      else
        status 400

      end
    end
  end

    def destroy
      @trip = Trip.find(params[:trip_id])
      @relationship = RiderRelationship.find(params[:id])
       @conversation = Conversation.find_by(trip_id: @trip, passenger_id: @relationship.passenger_id)
      @conversation.destroy
      @relationship.destroy
      redirect_to trip_path(@trip)
    end

  private
  def passenger_params
     params.require(:rider_relationship).permit(:passenger_id, :trip_id)
  end
end
