class ThingsController < ApplicationController
  def edit
    @thing = Thing.find(params[:id])
    session[:previous_url] = request.referer
  end

  def update
    @thing = Thing.find(params[:id])
    if @thing.update(thing_params)
      redirect_to session[:previous_url]
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def thing_params
    params.require(:thing).permit(:id, :thing_name, :person_name, :start_time, :end_time, :memo, :status_id)
  end
end
