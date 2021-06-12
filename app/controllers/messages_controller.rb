class MessagesController < ApplicationController
  before_action :require_user
  skip_before_action :verify_authenticity_token


  def create
    # add  message for current user
    message = current_user.messages.build(message_params)
    if message.save
      # de gui du lieu qua socket
      ActionCable.server.broadcast 'chatroom_channel',
                                   mod_message: message_render([message])
    end
  end

  def message_params
    params.require(:message).permit(:body)
  end

  private

  def message_render(message)
    # render(partial: 'message', message: message)
    render_to_string(partial: 'message', locals: { messages: message })
  end
end
