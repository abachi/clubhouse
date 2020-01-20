# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(
  name: 'clubhouser-1',
  email: 'clubhouser-1@example.com',
  password: 'secret',
  password_confirmation: 'secret')

  user.save

10.times do |i|
  title = Faker::Books::Lovecraft.sentence
  text = Faker::Books::Lovecraft.paragraph
  Post.create(title: title, body: text, user_id: user.id)
end