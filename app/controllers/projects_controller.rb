class ProjectsController < ApplicationController
  before_action :move_to_session
  before_action :share_space_params, only: [:index, :new, :show, :create]
  def index
    @projects = Project.where(user_id: current_user.id)
    @projects.each do |project|
      next unless project.registered_date < Time.zone.today

      date = project.registered_date
      flash[:alert] =
        "過去の予定が残っています。作業が完了していれば、予定を削除してください。(#{date})"
    end
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
    today = Time.zone.today
    @project = Project.new(project_params)
    @day_param = params[:project][:registered_date].to_date
    if today <= @day_param && @project.save
      redirect_to root_path
    elsif today > @day_param
      flash[:alert] =
        '昨日日付で登録しようとしています。正しい日付で登録してください。'
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
    @tasks = Task.where(project_id: @project.id).order('created_at ASC')
    @space = Space.where(project_id: params[:id])
    return if @space.nil?

    @space_id = @space.pluck(:id)
  end

  private

  def project_params
    params.require(:project).permit(:project_name, :registered_date,
                                    tasks_attributes: [:id, :task_name, :project_id, :_destroy,
                                                       { things_attributes: [:id, :thing_name, :person_name, :start_time, :end_time,
                                                                             :memo, :status_id, :task_id, :_destroy] }])
          .merge(user_id: current_user.id)
  end

  def share_space_params
    @spaces = Space.joins(:space_users).where(space_users: { user_id: current_user.id })
    @project_param = Project.joins(:space).select('projects.registered_date, projects.id')
  end

  def move_to_session
    return if user_signed_in?

    redirect_to new_user_session_path
  end
end
