class ConversationsController < ApplicationController
  def index
    @driver_convos = Conversation.where(driver_id: current_user)
  end

  def create
    @conversation = Conversation.new(convo_params)
    respond_to do |format|
      if @conversation.save
        @trip = Trip.find(@conversation.trip_id)
        format.html {redirect_to @trip}
        format.json { render :json => @conversation }
      else
        status 400
      end
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
    @trip = @conversation.trip
    @message = Message.new
    @passenger = RiderRelationship.new
    @relationship = RiderRelationship.find_by(passenger_id: current_user, trip_id: @trip.id)
  end

  private

  def convo_params
      params.require(:conversation).permit(:driver_id, :passenger_id, :trip_id)
  end
end
