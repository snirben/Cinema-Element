# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email:'snirben@gmail.com',password:'5109437',username:'snirben')


13.times do |i|
  Movie.create!(title:'test5',age_limit:i,price:i)
  Hall.create!(title:i, hall_num:i, floor:i, seats: 20)


end

13.times do |f|
  Screen.create!(movie_id:1,hall_id:3,screen_at:'"2021-01-06 20:35:08')
end