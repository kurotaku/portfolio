# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts '=== User ==='
user = User.new(name: 'kurotaku', email: "#{Rails.application.credentials.seed[:username]}@#{Rails.application.credentials.seed[:domain]}", password: 'password', first_name: '太郎', last_name: '山田')
user.skip_confirmation!
user.save!
user_1 = User.new(name: 'daisuke', email: "#{Rails.application.credentials.seed[:username]}+1@#{Rails.application.credentials.seed[:domain]}", password: 'password', first_name: '大介', last_name: '佐藤')
user_1.skip_confirmation!
user_1.save!

puts '=== Post ==='
user.posts.create(content: 'テスト投稿')
user.posts.create(content: 'テスト投稿2')
user.posts.create(content: 'テスト投稿3')
user_1.posts.create(content: 'テスト投稿4')
user_1.posts.create(content: 'テスト投稿5')
user_1.posts.create(content: 'テスト投稿6')
