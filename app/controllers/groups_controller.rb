class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.includes(:founds_drainers).find(params[:id])
  end

  def new
    @group = Group.new
  end

  # POST /groups
  def create
    @group = Group.new(group_params)
    @group.user = current_user

    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
