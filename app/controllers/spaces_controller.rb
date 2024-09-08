class SpacesController < ApplicationController
  before_action :move_to_session
  before_action :share_space_params
  def new
    @space = Space.new
    @orner_id = current_user.id
    @project = Project.find(params[:project_id])
  end

  def create
    @space = Space.new(space_params)
    if @space.save
      redirect_to project_path(id: params[:space][:project_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    space = Space.find(params[:id])
    @project = Project.find(space.project_id)
    @tasks = Task.where(project_id: @project.id).order('created_at ASC')
    @things = Thing.joins(:task_id).order('start_time DESC')
  end

  private

  def space_params
    params.require(:space).permit(:space_name, :orner_id, :project_id, user_ids: [])
    # params.permit(:space_name, :orner_id, :project_id, user_ids: [])
  end

  def share_space_params
    @spaces = Space.joins(:space_users).where(space_users: { user_id: current_user.id })
  end

  def move_to_session
    return if user_signed_in?

    redirect_to new_user_session_path
  end
end
