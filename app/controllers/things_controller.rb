class ThingsController < ApplicationController
  def edit
    @thing = Thing.find(params[:id])
    # @task_name = Task.find(@thing.task_id).task_name
    # session[:previous_url] = request.referer
  end

  def update
    @thing = Thing.find(params[:id])
    if @thing.update(thing_params)
      render json: @thing
      # redirect_to :back
    else
      render json: @thing.errors, status: :unprocessable_entity
    end
  end

  def new
    redirect_to new_user_session_path unless user_signed_in?
    @thing = Thing.new
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

  private

  def thing_params
    params.require(:thing).permit(:id, :thing_name, :person_name, :start_time, :end_time, :memo, :status_id, :task_id)
  end
end
