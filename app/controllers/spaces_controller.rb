class SpacesController < ApplicationController
  def new
    @space = Space.new
    @users = User.where.not(id: current_user.id)
  end

  def create
    # binding.pry
    @space = Space.new(space_params)
    if @space.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def room_params
    params.require(:space).permit(:space_name, user_ids: [])
  end
end
