class ProjectsController < ApplicationController
  def index
    @projects = Project.find(current_user.id)
    # binding.pry
  end

  def new
    @project = Project.new
    tasks = @project.tasks.build
    tasks.things.build
    @day_param = params[:date]
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:project_name, :registered_date,
                                    tasks_attributes: [:id, :task_name, :project_id, :_destroy,
                                                       { things_attributes: [:id, :thing_name, :person_name, :start_time, :end_time,
                                                                             :memo, :status_id, :task_id, :_destroy] }])
          .merge(user_id: current_user.id)
  end
end
