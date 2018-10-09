class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def update
    if @user.update(user_params)
      flash[:notice] = "User profile was successfully updated"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "User profile was failed to update"
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :intro, :avatar)
  end

end
