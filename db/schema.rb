# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_201_230_154_356) do
  create_table 'board_users', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'board_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['board_id'], name: 'index_board_users_on_board_id'
    t.index ['user_id'], name: 'index_board_users_on_user_id'
  end

  create_table 'boards', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4', force: :cascade do |t|
    t.integer 'status', default: 0, null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'messages', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'board_id', null: false
    t.string 'content'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['board_id'], name: 'index_messages_on_board_id'
    t.index ['user_id'], name: 'index_messages_on_user_id'
  end

  create_table 'posts', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4', force: :cascade do |t|
    t.string 'uuid'
    t.string 'content'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_posts_on_user_id'
  end

  create_table 'users', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.string 'uuid'
    t.string 'image'
    t.string 'first_name'
    t.string 'last_name'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'board_users', 'boards'
  add_foreign_key 'board_users', 'users'
  add_foreign_key 'messages', 'boards'
  add_foreign_key 'messages', 'users'
  add_foreign_key 'posts', 'users'
end
