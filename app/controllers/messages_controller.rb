class MessagesController < ApplicationController
  def index
    @message = Message.new
    @space = Space.find(params[:space_id])
    @messages = @space.messages.includes(:user)
  end

  def create
    @space = Space.find(params[:space_id])
    @message = @space.messages.new(message_params)
    if @message.save
      redirect_to space_messages_path(@space)
    else
      @messages = @space.messages.includes(:user)
      render :index, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
