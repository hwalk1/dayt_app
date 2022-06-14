# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'json'
require "open-uri"

puts 'deleting everything 🤯'
TripDayt.destroy_all
Dayt.destroy_all
Trip.destroy_all
User.destroy_all

puts "Creating Users 💃"
aren = User.new(name:"Aren", password:"123456", email:"aren@gmail.com")
hayden = User.new(name:"Hayden", password:"123456", email:"hayden@gmail.com")
michael = User.new(name:"Michael", password:"123456", email:"michael@gmail.com")
lea = User.new(name:"Lea", password:"123456", email:"lea@gmail.com")

users = [aren, hayden, michael, lea]

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

puts 'creating Dayts 🌞'

corner = Dayt.new(
  title: 'Corner Hotel',
  content: 'Popular landmark for local & international music acts, with a rooftop bar & pub grub menu.',
  location: '57 Swan St, Richmond VIC 3121',
  duration: 2,
  price: 30,
  opening_time: 12,
  closing_time: 1,
  booking_url: 'https://cornerhotel.com/',
  tag_list: ['Nightlife', 'Music', 'Indoor', 'Lunch', 'Dinner', 'Drinks']
)

file = URI.open('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.concreteplayground.com%2Fcontent%2Fuploads%2F2017%2F02%2FThe-Corner-Hotel-Richmond-rooftop1.jpeg&f=1&nofb=1')
corner.photos.attach(io: file, filename: 'corner1.png', content_type: 'image/png')
file = URI.open('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.newsapi.com.au%2Fimage%2Fv1%2F1434b69bbf3e3039420e795a80d4b60d%3Fwidth%3D1024&f=1&nofb=1')
corner.photos.attach(io: file, filename: 'corner2.png', content_type: 'image/png')
corner.user = hayden
corner.save

grotto = Dayt.new(
  title: 'The Grotto',
  content: 'A secluded spot close to the city to take you away',
  location: 'Alexandra Ave, Melbourne VIC 3004',
  duration: 1,
  price: 0,
  tag_list: ['Free', 'Outdoor', 'Nice Walk']
)

file = URI.open('https://citycollection.melbourne.vic.gov.au/wp-content/uploads/2021/09/1091165-5-1024x683.jpg')
grotto.photos.attach(io: file, filename: 'grotto.png', content_type: 'image/png')
grotto.user = aren
grotto.save

lewagon = Dayt.new(
  title: 'Le Wagon Melbourne',
  content: 'Learn how to build software and solve problems with our 9/24-week bootcamp in Melbourne.',
  location: '41 Stewart St, Melbourne c/o Inspire9, Level1, Richmond VIC 3121',
  duration: 1,
  price: 0,
  tag_list: ['Free', 'Le Wagon awesome course', 'Indoor']
)

file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,h_240,q_auto,w_520/v1622427318/w0tv5qudjqevpz1fzgb2.webp')
lewagon.photos.attach(io: file, filename: 'lewagon.png', content_type: 'image/png')
lewagon.user = aren
lewagon.save

mcg = Dayt.new(
  title: 'Melbourne Cricket Ground',
  content: 'The Melbourne Cricket Ground, also known locally as "The \'G", is an Australian sports stadium located in Yarra Park, Melbourne, Victoria.',
  location: 'Brunton Ave, Richmond VIC 3002',
  duration: 1,
  price: 35,
  booking_url: 'https://www.mcg.org.au/',
  tag_list: ['Outdoor', 'Sport', 'Drinks']
)

file = URI.open('https://www.austadiums.com/news/images/mcg-aerial-pic1.jpg')
mcg.photos.attach(io: file, filename: 'mcg.png', content_type: 'image/png')
mcg.user = aren
mcg.save

ngv = Dayt.new(
  title: 'National Gallery of Victoria',
  content: 'The National Gallery of Victoria, popularly known as the NGV, is an art museum in Melbourne, Victoria, Australia. Founded in 1861, it is Australia\'s oldest and most visited art museum.',
  location: '180 St Kilda Rd, Melbourne VIC 3006',
  duration: 2,
  price: 0,
  opening_time: 10,
  closing_time: 5,
  booking_url: 'https://connect.ngv.vic.gov.au/events',
  tag_list: ['Art', 'Indoor']
)

file = URI.open('https://content.ngv.vic.gov.au/col-images/api-access/INST048987/1280')
ngv.photos.attach(io: file, filename: 'ngv.png', content_type: 'image/png')
ngv.user = aren
ngv.save

fishbowl = Dayt.new(
  title: 'Fishbowl',
  content: 'At FISHBOWL, we want to deliver the food that nature provided with minimal intervention and maximum care in a fun and authentic way.',
  location: '89A Swan St, Richmond VIC 3121',
  duration: 1,
  price: 17,
  opening_time: 11,
  closing_time: 9,
  booking_url: 'https://food.google.com/chooseprovider?restaurantId=/g/11qmy7pkn6&g2lbs&sei',
  tag_list: ['Indoor', 'Lunch', 'Dinner']
)

file = URI.open('https://media.timeout.com/images/105558062/image.jpg')
fishbowl.photos.attach(io: file, filename: 'fishbowl.png', content_type: 'image/png')
fishbowl.user = aren
fishbowl.save

bdl = Dayt.new(
  title: 'Beneath Driver Lane',
  content: 'Beneath Driver Lane wants to take you away from the world above and into another place and time. You could be anywhere; a basement in Paris, New Orleans, New York or San Fran – the blues is always deep and you’re greeted with a smile, true hospitality!',
  location: '3, Driver Ln, Melbourne VIC 3000',
  duration: 1,
  price: 20,
  opening_time: 6,
  closing_time: 1,
  tag_list: ['Nightlife', 'Music', 'Indoor', 'Drinks']
)

file = URI.open('https://whatson.melbourne.vic.gov.au/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaEpJaWt5TjJRMk56STJPQzFqTVRrd0xUUXlNV1V0T1RCa05pMDVOVGRsTkdZME5qYzJZekVHT2daRlZBPT0iLCJleHAiOm51bGwsInB1ciI6ImJsb2JfaWQifX0=--137e9040a0d98fc519b4ebefdb14e5e2d93531b9/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9VY21WemFYcGxYM1J2WDJ4cGJXbDBXd2RwQXE0Q2FRTE1BUT09IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--6b649797a60ed07e66abb743103d0e385829f44a/beneath-20driver-201.jpg')
bdl.photos.attach(io: file, filename: 'bdl.png', content_type: 'image/png')
bdl.user = aren
bdl.save

forum = Dayt.new(
  title: 'The Forum',
  content: 'Forum Melbourne is a live music, cinema, theatre, and event venue located on the corner of Flinders Street and Russell Street in Melbourne, Australia. Built in 1929, it was designed by leading US ‘picture palace’ architect John Eberson, in association with the local architectural firm Bohringer, Taylor & Johnson',
  location: '154 Flinders St, Melbourne VIC 3000',
  duration: 2,
  price: 40,
  booking_url: 'https://forummelbourne.com.au/',
  tag_list: ['Nightlife', 'Music', 'Indoor', 'Drinks']
)

file = URI.open('https://marrinergroup.com.au/uploads/Image-46-1533083252.jpg')
forum.photos.attach(io: file, filename: 'forum.png', content_type: 'image/png')
forum.user = aren
forum.save

rising = Dayt.new(
  title: 'RISING: Melbourne',
  content: 'RISING is a surge of art, music, performance and ceremony in the heart of Melbourne.',
  location: 'Level 2/377 Lonsdale St, Melbourne VIC 3000',
  duration: 1,
  price: 20,
  booking_url: 'https://rising.melbourne/',
  tag_list: ['Art', 'Nightlife', 'Music', 'Indoor', 'Outdoor', 'Lunch', 'Dinner', 'Drinks']
)

file = URI.open('https://www.visitmelbourne.com/-/media/images/melbourne/events/rising_wilds-20210526-dsc1044_1150x863.jpg?ts=20220329440418')
rising.photos.attach(io: file, filename: 'rising.png', content_type: 'image/png')
rising.user = aren
rising.save

# puts 'faker time! 🤡'
# # faker time
# 10.times do
#   dayt = Dayt.new(
#     title: Faker::Restaurant.name,
#     content: Faker::Restaurant.description,
#     location: "#{Faker::Address.street_address} #{Faker::Address.city}",
#     duration: rand(1..3),
#     price: rand(10..40),
#     opening_time: rand(10..15),
#     closing_time: rand(15..22),
#     user: users.sample,
#     latitude: Faker::Address.latitude,
#     longitude: Faker::Address.longitude
#   )
#   file = URI.open("http://loremflickr.com/280/280/shop")
#   dayt.photos.attach(io: file, filename: "#{dayt.title}.png", content_type: 'image/png')
#   dayt.save
# end
