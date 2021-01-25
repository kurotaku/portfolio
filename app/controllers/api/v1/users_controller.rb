class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  def index
  end

  def show
    render json: @user
  end

  private

  def set_user
    @user = User.find_by(uuid: params[:uuid])
  end
end
