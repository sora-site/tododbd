class SpacesController < ApplicationController
  def index
  end

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

  private

  def space_params
    params.require(:space).permit(:space_name, :orner_id, :project_id, user_ids: [])
  end
end
