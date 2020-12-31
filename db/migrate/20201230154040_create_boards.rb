class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.integer :status, null: false, default: 0
      t.string :uuid
      t.timestamps
    end
  end
end
