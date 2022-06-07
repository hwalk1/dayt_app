# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Dayt.destroy_all
User.destroy_all

puts "Creating Users"
aren = User.create(name:"Aren", password:"123456", email:"aren@gmail.com")
hayden = User.create(name:"Hayden", password:"123456", email:"hayden@gmail.com")
michael = User.create(name:"Michael", password:"123456", email:"michael@gmail.com")
lea = User.create(name:"Lea", password:"123456", email:"lea@gmail.com")

file = URI.open('https://avatars.githubusercontent.com/u/72479887?v=4')
aren.avatar.attach(io: file, filename: 'aren.png', content_type: 'image/png')
aren.save

file = URI.open('https://avatars.githubusercontent.com/u/103393659?v=4')
michael.avatar.attach(io: file, filename: 'michael.png', content_type: 'image/png')
michael.save

file = URI.open('https://avatars.githubusercontent.com/u/102561039?v=4')
lea.avatar.attach(io: file, filename: 'lea.png', content_type: 'image/png')
lea.save

file = URI.open('https://avatars.githubusercontent.com/u/62589313?v=4')
hayden.avatar.attach(io: file, filename: 'hayden.png', content_type: 'image/png')
hayden.save
