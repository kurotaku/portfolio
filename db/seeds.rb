# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts '=== User ==='
username = Rails.application.credentials.seed[:username]
domain = Rails.application.credentials.seed[:domain]
user = User.new(name: 'yamada', email: "#{username}@#{domain}", password: 'password', first_name: '太郎', last_name: '山田')
user.skip_confirmation!
user.save!
user_1 = User.new(name: 'daisuke', email: "#{username}+1@#{domain}", password: 'password', first_name: '大介', last_name: '佐藤')
user_1.skip_confirmation!
user_1.save!
user_2 = User.new(name: 'ichiro', email: "#{username}+2@#{domain}", password: 'password', first_name: '一郎', last_name: '鈴木')
user_2.skip_confirmation!
user_2.save!
user_3 = User.new(name: 'okuda', email: "#{username}+3@#{domain}", password: 'password', first_name: '泰', last_name: '奥田')
user_3.skip_confirmation!
user_3.save!

puts '=== Post ==='
user.posts.create!(content: 'テスト投稿')
user.posts.create!(content: 'テスト投稿2')
user.posts.create!(content: 'テスト投稿3')
user_1.posts.create!(content: 'テスト投稿4')
user_1.posts.create!(content: 'テスト投稿5')
user_1.posts.create!(content: 'テスト投稿6')

puts '=== Board ==='
board = Board.create!
board_1 = Board.create!
board_2 = Board.create!
board_3 = Board.create!

board.board_users.create!(user: user)
board.board_users.create!(user: user_1)

board_1.board_users.create!(user: user)
board_1.board_users.create!(user: user_2)

board_2.board_users.create!(user: user)
board_2.board_users.create!(user: user_3)

puts '=== Message ==='
Message.create!(user: user, board: board, content: '只今の時刻は' + Time.zone.now.strftime("%Y年%m月%d日%H時%M分%S秒") + 'です')
Message.create!(user: user_1, board: board, content: '只今の時刻は' + Time.zone.now.strftime("%Y年%m月%d日%H時%M分%S秒") + 'です')
Message.create!(user: user_1, board: board, content: '只今の時刻は' + Time.zone.now.strftime("%Y年%m月%d日%H時%M分%S秒") + 'です')
Message.create!(user: user, board: board, content: '只今の時刻は' + Time.zone.now.strftime("%Y年%m月%d日%H時%M分%S秒") + 'です')
Message.create!(user: user_1, board: board, content: '只今の時刻は' + Time.zone.now.strftime("%Y年%m月%d日%H時%M分%S秒") + 'です')
Message.create!(user: user_1, board: board, content: '只今の時刻は' + Time.zone.now.strftime("%Y年%m月%d日%H時%M分%S秒") + 'です')


Message.create!(user: user, board: board_1, content: '只今の時刻は' + Time.zone.now.strftime("%Y年%m月%d日%H時%M分%S秒") + 'です')
Message.create!(user: user_2, board: board_1, content: '只今の時刻は' + Time.zone.now.strftime("%Y年%m月%d日%H時%M分%S秒") + 'です')
Message.create!(user: user_2, board: board_1, content: '只今の時刻は' + Time.zone.now.strftime("%Y年%m月%d日%H時%M分%S秒") + 'です')

Message.create!(user: user, board: board_2, content: '只今の時刻は' + Time.zone.now.strftime("%Y年%m月%d日%H時%M分%S秒") + 'です')
Message.create!(user: user_2, board: board_2, content: '只今の時刻は' + Time.zone.now.strftime("%Y年%m月%d日%H時%M分%S秒") + 'です')
Message.create!(user: user_2, board: board_2, content: '只今の時刻は' + Time.zone.now.strftime("%Y年%m月%d日%H時%M分%S秒") + 'です')

