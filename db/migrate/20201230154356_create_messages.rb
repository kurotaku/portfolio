class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :uuid
      t.references :user, null: false, foreign_key: true
      t.references :board, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
