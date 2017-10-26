class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: "グループできました"
    else render 'new'
    end
  end

  def edit
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
