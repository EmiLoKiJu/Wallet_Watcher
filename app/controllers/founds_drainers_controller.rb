class FoundsDrainersController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @founds_drainer = FoundsDrainer.new
    authorize! :create, @founds_drainer
  end

  # POST /groups
  def create
    @group = Group.find(params[:group_id])
    @founds_drainer = FoundsDrainer.new(fd_params)
    @founds_drainer.author = current_user
    authorize! :new, @founds_drainer

    if @founds_drainer.save
      redirect_to group_path(@group), notice: 'Found drainer was successfully created.'
    else
      render :new
    end
  end

  private

  def fd_params
    params.require(:founds_drainer).permit(:name, :amount, group_ids: [])
  end
end
