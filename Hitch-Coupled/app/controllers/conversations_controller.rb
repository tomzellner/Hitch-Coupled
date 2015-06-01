class ConversationsController < ApplicationController
  def index
    @driver_convos = Conversation.where(driver_id: current_user)
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
  end
end
