class ProjectsController < ApplicationController
  def index
  end

  def new
    @project = Project.new
    @task = @project.task.build
    @thing = @task.thing.build
  end

  private

  def project_params
    params.require(:project).permit(:project_name,
                                    tasks_attributes: [:id, :task_name, :project_id, :_destroy,
                                                       { things_attributes: [:id, :thing_name, :person_name, :start_time, :end_time,
                                                                             :memo, :status_id, :task_id, :_destroy] }])
          .merge(user_id: current_user.id, registered_date: Time.zone.today)
  end
end
