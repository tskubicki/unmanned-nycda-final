class MessagesController < ApplicationController
  def index
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
  end

  def change
  end

  def destroy
  end

  private
  def message_params
      params.require(:message).permit(:user_id, :sender_id, :content)
  end
end
