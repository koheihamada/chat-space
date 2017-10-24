class UsersController < ApplicationController

  def create
    User.create(name: :name, email: :email, password: :password)
  end

  def edit
  end

  def update
    user = current_user
    user.update(user_params)
    redirect_to root_path
  end

  def show
  end


  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
