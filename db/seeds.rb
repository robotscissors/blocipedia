# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require 'random_data'
@testUser=User.new(
  email:  "cjbazin@gmail.com",
  #encrypted_password:   Faker::Internet.password(8)
  password: "helloworld",
  password_confirmation: "helloworld"
)
@testUser.skip_confirmation!
@testUser.save!


10.times do
  @pass = Faker::Internet.password(8)
  user = User.new(
    email:  Faker::Internet.email,
    #encrypted_password:   Faker::Internet.password(8)
    password: @pass,
    password_confirmation: @pass
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

50.times do #create wikis

 Wiki.create!(
     title:  Faker::Lorem.sentence(3, true, 4),
     body:   Faker::Lorem.paragraph(10, true),
     private: Faker::Boolean.boolean(0.5),
     user: users.sample
 )
end
wikis = Wiki.all


puts "Seed finished"
puts "#{User.count} Users created"
puts "#{Wiki.count} Wikis created"
 # puts "#{Comment.count} comments created"
