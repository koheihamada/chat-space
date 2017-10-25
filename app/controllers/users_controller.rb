class UsersController < ApplicationController


  def edit
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path, notice: "アカウントを変更しました"
    else
      redirect_to edit_user_path(current_user), notice: "何かが違います、なにかが"
    end
  end



  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
