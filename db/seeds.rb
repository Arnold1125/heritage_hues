# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"
require "open-uri" # to go at the top of the seed file

Booking.destroy_all
Clothing.destroy_all
User.destroy_all

puts "Creating 15 users..."
15.times do
  new_user = User.new(email: Faker::Internet.email, password: "123123")
  new_user.save!
end
puts "#{User.all.count} users created"

puts "Creating 20 clothing items..."
clothing_items = [
  "Kimono", "Hanbok", "Sari", "Qipao", "Dirndl", "Kilt", "Thobe", "Poncho", "Barong Tagalog", "Djellaba",
  "Baju Melayu", "Ao Dai", "Dashiki", "Sarong", "Lehenga", "Gho", "Chapan", "Huipil", "Sombrero Vueltiao", "Shuka"
]

clothing_items.each do |item|
  clothing = Clothing.new(name: item, price: rand(1000..10000), size: ["S", "M", "L"].sample)
  clothing.user = User.all.sample
  image_path = Rails.root.join("app/assets/images/#{item.downcase.gsub(' ', '_')}.png")
  puts "Looking for image: #{image_path}"
  if File.exist?(image_path)
    file = File.open(image_path)
    clothing.photo.attach(io: file, filename: "#{item.parameterize}.jpg", content_type: "image/jpeg")
  else
    puts "⚠️ Image not found for #{item}, skipping attachment."
  end
  clothing.save!
end

puts "#{Clothing.all.count} clothes created"

puts "Creating 10 bookings..."
10.times do
  booking = Booking.create!(user: User.all.sample, clothing: Clothing.all.sample)
end
puts "#{Booking.all.count} bookings created"
