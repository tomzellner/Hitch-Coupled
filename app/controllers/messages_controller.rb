class MessagesController < ApplicationController

    def create
      @message= Message.new(message_params)
      respond_to do |format|
        if @message.save
          format.html {redirect_to conversation_path(@message.conversation_id)}
          format.json { render :json => @message }
        else
          status 400
        end
      end
    end

private

    def message_params
      params.require(:message).permit(:user_id, :conversation_id, :text)
    end
end
