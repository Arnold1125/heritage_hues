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

puts "Creating 30 users..."
new_user = User.new(email: "arnold@heritage.com", password: "123123")
new_user.save!
new_user = User.new(email: "aliya@heritage.com", password: "123123")
new_user.save!
new_user = User.new(email: "prachi@heritage.com", password: "123123")
new_user.save!
new_user = User.new(email: "remy@heritage.com", password: "123123")
new_user.save!

26.times do
  new_user = User.new(email: Faker::Internet.email, password: "123123")
  new_user.save!
end
puts "#{User.all.count} users created"

puts "Creating 20 clothing items..."
clothing_items = [
  "Kimono", "Hanbok", "Sari", "Qipao", "Dirndl", "Kilt", "Thobe", "Poncho", "Barong Tagalog", "Djellaba",
  "Baju Melayu", "Ao Dai", "Dashiki", "Sarong", "Lehenga", "Gho", "Chapan", "Huipil", "Sombrero Vueltiao", "Shuka"
]

clothing_descriptions = [
  "A traditional Japanese garment known for its elegant flowing silhouette and intricate patterns.",
  "A beautiful Korean attire characterized by vibrant colors and graceful lines, worn on special occasions.",
  "A stunning South Asian drape that exudes elegance and comes in countless fabrics and designs.",
  "A form-fitting Chinese dress with a high collar and side slits, symbolizing sophistication and tradition.",
  "A charming Bavarian dress with a fitted bodice and full skirt, often worn at Oktoberfest celebrations.",
  "A traditional Scottish garment made of tartan fabric, representing clan heritage and worn with pride.",
  "A long, flowing robe worn by men in the Arabian Peninsula, known for its simplicity and cultural significance.",
  "A versatile Andean outer garment, woven from wool or alpaca, offering warmth and style.",
  "A formal embroidered shirt from the Philippines, made of delicate fabric and worn for special events.",
  "A loose-fitting Moroccan robe with a pointed hood, perfect for both casual wear and special occasions.",
  "A classic Malay outfit featuring a tunic and trousers, often worn with a sampin for a polished look.",
  "A Vietnamese long tunic with slits on both sides, paired with pants for an elegant and graceful appearance.",
  "A brightly colored West African shirt with bold patterns, symbolizing cultural pride and heritage.",
  "A lightweight wrap-around skirt worn in tropical regions, perfect for comfort and casual elegance.",
  "A heavily embroidered skirt and blouse set worn in India, often adorned with intricate beadwork and sequins.",
  "A knee-length robe worn by Bhutanese men, secured with a traditional woven belt called a kera.",
  "A richly decorated Central Asian coat, made from luxurious fabrics and often worn as a sign of status.",
  "A traditional handwoven blouse from Central America, showcasing colorful designs unique to each region.",
  "A distinctive handwoven hat from Colombia, made from cane fiber and featuring intricate patterns.",
  "A brightly colored Maasai garment, often wrapped around the body and worn with beaded accessories."
]

clothing_items.each_with_index do |item, index|
  clothing = Clothing.new(
    name: item,
    price: rand(1000...10_000).round(-1),
    size: ["S", "M", "L"].sample,
    description: clothing_descriptions[index]
  )
  clothing.user = User.all.sample
  image_path = Rails.root.join("app/assets/images/#{item.downcase.gsub(' ', '_')}.png")
  if File.exist?(image_path)
    file = File.open(image_path)
    clothing.photo.attach(io: file, filename: "#{item.parameterize}.jpg", content_type: "image/jpeg")
  else
    puts "⚠️ Image not found for #{item}, skipping attachment."
  end
  clothing.save!
end

puts "#{Clothing.all.count} clothes created"

puts "Creating 5 bookings..."
15.times do
  booking = Booking.new(user: User.first(4).sample, clothing: Clothing.all.sample)
  booking.status = ["pending", "accepted"].sample
  booking.start_date = Date.today + rand(1..30)
  booking.end_date = booking.start_date + rand(1..10)
  booking.save!
end

puts "#{Booking.all.count} bookings created"
