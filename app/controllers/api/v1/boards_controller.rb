class Api::V1::BoardsController < ApplicationController
  def index
    render json: current_user.boards.order(created_at: 'DESC')
  end
end
