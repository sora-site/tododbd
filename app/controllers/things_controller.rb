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
    @things = Thing.new
    # projectと紐づくtasks.thingsをビルド
  end

  def create
    @thing = Thing.new(thing_params)
    if @thing.save
      render json: @thing
    else
      render json: @thing.errors, status: :unprocessable_entity
    end
  end

  private

  def thing_params
    params.require(:thing).permit(:id, :thing_name, :person_name, :start_time, :end_time, :memo, :status_id, :task_id)
  end
end
