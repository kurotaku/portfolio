class Api::V1::BoardsController < ApplicationController
  def index
    render json: current_user.boards
  end
end
