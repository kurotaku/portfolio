class BoardsController < ApplicationController
  def index; end

  def create
    service = GenerateBoardsService.new(params[:owner_uuid], params[:invited_user_uuid])
    service.perform
    redirect_to message_path
  end
end
