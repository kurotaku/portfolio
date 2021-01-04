class Api::V1::MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if params[:board_uuid].present?
      board = (params[:board_uuid] == 'default') ? current_user.boards.last : Board.find_by!(uuid: params[:board_uuid])
    end
    messages = Message.where(board: board).order(created_at: 'ASC') if board
    render json: messages
  end

  def create
    @message = current_user.messages.create(message_params)
    render json: @message
  end

  private

  def message_params
    params.require(:message).permit(:board_id, :content)
  end
end
