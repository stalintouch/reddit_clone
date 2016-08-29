# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "Example User",
             email: "example@gmail.com",
             password:              "password",
             password_confirmation: "password")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
5.times do
  content = Faker::Lorem.sentence(5)
   users.each { |user| user.links.create!(title: content, url: "https://www.google.ca/#q=funny+images") }
end

link = Link.all
10.times do
  content = Faker::Lorem.sentence(5)
  link.each { |link| link.comments.create!(body: content) } 
end