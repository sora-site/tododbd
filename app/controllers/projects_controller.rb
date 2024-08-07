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
    @day_param = params[:date].to_date
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy if user_signed_in? && project.user_id == current_user.id
    redirect_to root_path
  end

  def show
    @project = Project.find(params[:id])
    @tasks = Task.where(project_id: params[:id]).order('updated_at DESC')
    @things = Thing.joins(:task_id).order('start_time DESC')
    space = Space.where(project_id: params[:id])
    return if space.nil?

    @space_id = space.pluck(:id)
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
