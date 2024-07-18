class ThingsController < ApplicationController
  def edit
    @thing = Thing.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_edit_params)
      redirect_to request.referer
    else
      render :show, status: :unprocessable_entity
    end
  end
end
