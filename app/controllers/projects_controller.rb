class ProjectsController < ApplicationController
  def index
    @projects = Project.where(user_id: current_user.id)
  end

  def new
    @project = Project.new
    # projectと紐づくtasks.thingsをビルド
    tasks = @project.tasks.build
    tasks.things.build
    # ビューから送信された日付情報を取得
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

  def show
    @project = Project.find(params[:id])
    @tasks = Task.includes(:project).order('updated_at DESC')
    @things = Thing.includes(:task).order('start_time DESC')

    @thing_count = []
    daily_task = Task.where(project_id: params[:id])
    daily_task.each do |task|
      count = Thing.where(task_id: task.id).count.to_i
      @thing_count.push(count)
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
