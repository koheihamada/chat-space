class GroupsController < ApplicationController

  def index
  end

  def new
    @group = Group.new


  end

  def create
    @group = current_user.groups.new(group_params)
    # @group.user << current_user
    if @group.save
      redirect_to root_path, notice: "グループできました"
    else render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to root_path, notice: "グループを変更しました"
    else
      render 'edit'
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
