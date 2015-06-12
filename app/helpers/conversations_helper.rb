module ConversationsHelper
  def user_convos
    driver_convos.concat(passenger_convos)
  end

  def driver_convos
    Conversation.where(driver_id: current_user.id).to_a
  end

  def passenger_convos
    Conversation.where(passenger_id: current_user.id).to_a
  end

end
