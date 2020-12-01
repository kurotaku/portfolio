# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts '=== User ==='
user = User.new(name: 'kurotaku', email: 'test@test.com', password: 'password')
user.skip_confirmation!
user.save!


puts '=== Post ==='
user.posts.create(content: 'テスト投稿')
user.posts.create(content: 'テスト投稿2')
user.posts.create(content: 'テスト投稿3')