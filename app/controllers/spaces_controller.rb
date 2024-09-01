class SpacesController < ApplicationController
  def new
    @space = Space.new
    @orner_id = current_user.id
    @project_id = params[:project_id]
  end

  def create
    @space = Space.new(space_params)
    if @space.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @space = Space.find(params[:id])
    @project = Project.find(params[:project_id])
    @tasks = Task.where(project_id: @project.id).order('created_at ASC')
    @things = Thing.joins(:task_id).order('start_time DESC')
  end

  private

  def space_params
    params.require(:space).permit(:space_name, :orner_id, :project_id, user_ids: [])
  end
end
