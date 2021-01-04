class Api::V1::MessagesController < ApplicationController
  def index
    messages = current_user.messages.order(created_at: 'DESC')
    if params[:board_uuid].present?
      board = (params[:board_uuid] == 'default') ? current_user.boards.last : Board.find_by!(uuid: params[:board_uuid])
    end
    messages = messages.where(board: board).order(created_at: 'DESC') if board
    render json: messages
  end
end
