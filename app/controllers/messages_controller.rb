class MessagesController < ApplicationController
  def index
    @messages = Message.all()
  end

  def new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      #yay
    else
      #boo
    end
    redirect_to :back
  end

  def show
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])

    if @message.update(message_params)
      #yay
    else
      #boo
    end
    redirect_to messages_path

  end

  def destroy
    @message = Message.find(params[:id])
    if @message.destroy()
      #yay
    else
      #boo
    end
    redirect_to messages_path
  end

  private
  def message_params
      params.require(:message).permit(:user_id, :sender_id, :content)
  end
end
