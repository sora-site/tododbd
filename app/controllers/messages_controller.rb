class MessagesController < ApplicationController
  def index
    @message = Message.new
    @space = Space.find(params[:space_id])
    @messages = @space.messages.includes(:user)
    project_id = @space.project_id
    @project = Project.find(project_id)
    @tasks = Task.where(project_id:).order('updated_at DESC')
    @things = Thing.joins(:task_id).order('start_time DESC')
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
