class FoundsDrainersController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @founds_drainer = FoundsDrainer.new
  end
  
  # POST /groups
  def create
    @group = Group.find(params[:group_id])
    @founds_drainer = @group.founds_drainers.build(fd_params)
    @founds_drainer.author = current_user
  
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
