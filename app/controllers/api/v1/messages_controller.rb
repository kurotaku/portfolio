class Api::V1::MessagesController < ApplicationController
  def index
    messages = current_user.messages
    if params[:board_uuid].present?
      board = Board.find_by!(uuid: params[:board_uuid])
      messages = messages.where(board: board)
    end
    render json: messages
  end
end
