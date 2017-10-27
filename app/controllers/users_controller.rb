class UsersController < ApplicationController


  def edit
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path, notice: "アカウントを変更しました"
    else
      render 'edit'
    end
  end



  private
  def user_params
    params.require(:group).permit(:name, :email)
  end
end
