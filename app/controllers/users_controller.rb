class UsersController < ApplicationController

  def create
    user = User.new(user_params)

    if user.save
      redirect_to root_path
    else
      flash[:notice] = "Error creating the user"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
