class MessagesController < ApplicationController

  def index
    @messages = Message.all.reverse.first(10)
    @message = Message.new
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user

    if @message.save!
      respond_to do |format|
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'messages/index' }
        format.js  # <-- idem
      end
    end
  end


  private

  def message_params
  params.require(:message).permit(:content)
  end

end

