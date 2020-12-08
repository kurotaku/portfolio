class UserProfilesController < ApplicationController
	before_action :set_user, only: %i[show edit update]

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_profile_path, notice: t('.success')
    else
      flash.now[:danger] = 'error!'
      render 'edit'
    end
  end

  private

  def set_user
  	@user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :image)
  end
end
