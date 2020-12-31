class GenerateBoardsService
  # include BaseService

  attr_reader :owner_uuid, :invited_user_uuid

  def initialize(owner_uuid, invited_user_uuid)
    @owner = User.find_by!(uuid: owner_uuid)
    @invited_user = User.find_by!(uuid: invited_user_uuid)
  end

  def perform
    ApplicationRecord.transaction do
      board = Board.create!
      BoardUser.create!(board: board, user: @owner)
      BoardUser.create!(board: board, user: @invited_user)
    end
  end
end
