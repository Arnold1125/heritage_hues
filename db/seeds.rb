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

clothing_address = [
"日本, 〒150-0002 東京都渋谷区渋谷５丁目３番６号",
"日本, 〒160-0022 東京都新宿区新宿３丁目２８番１４号",
"日本, 〒116-0002 東京都荒川区荒川６丁目１３番５号",
"日本, 〒107-0052 東京都港区赤坂７丁目６番５６号",
"日本, 〒169-0071 東京都新宿区戸塚町１丁目１０４番地",
"日本, 〒150-0012 東京都渋谷区広尾３丁目１１番１１号",
"日本, 〒131-0031 東京都墨田区墨田１丁目１４番７号",
"日本, 〒105-0011 東京都港区芝公園１丁目５番３２号",
"日本, 〒135-0063 東京都江東区有明１丁目２番３９号",
"日本, 〒176-0014 東京都練馬区豊玉南３丁目３２番２７号",
"日本, 〒135-0016 東京都江東区東陽７丁目２番３６号",
"日本, 〒151-0066 東京都渋谷区西原２丁目１４番２１号",
"日本, 〒110-0016 東京都台東区台東３丁目２１番４号",
"日本, 〒154-0021 東京都世田谷区豪徳寺２丁目１９番１４号",
"日本, 〒150-0013 東京都渋谷区恵比寿１丁目１６番２８号",
"日本, 〒153-0063 東京都目黒区目黒２丁目１１番３号",
"日本, 〒110-0005 東京都台東区上野４丁目１５番８号",
"日本, 〒106-0032 東京都港区六本木６丁目７番１９号",
"日本, 〒104-0061 東京都中央区銀座３丁目１２番５号"
]

store_name = [
"Kimono Store Tokyo",
"Hanbok Rental Tokyo",
"Sari Collection Japan",
"Qipao Fashion",
"Dirndl Tokyo",
"Kilt Japan",
"Thobe Styles",
"Poncho & More",
"Barong Tagalog Hub",
"Djellaba Wear",
"Baju Melayu Tokyo",
"Ao Dai Designs",
"Dashiki Street",
"Sarong Fashion",
"Lehenga Couture",
"Gho & More",
"Le Wagon Tokyo",
"Le Wagon Tokyo",
"Le Wagon Tokyo",
"Le Wagon Tokyo"

]
  # { lat: 35.6895, lng: 139.6917, name: "Kimono Store Tokyo", address: "1 Chome-2-3 Asakusa, Taito City, Tokyo, Japan" },
  # { lat: 35.6618, lng: 139.7041, name: "Hanbok Rental Tokyo", address: "5 Chome-3-6 Shibuya, Tokyo, Japan" },
  # { lat: 35.6938, lng: 139.7034, name: "Sari Collection Japan", address: "3 Chome-28-14 Shinjuku, Tokyo, Japan" },
  # { lat: 35.6804, lng: 139.7690, name: "Qipao Fashion", address: "Chiyoda City, Tokyo, Japan" },
  # { lat: 35.6705, lng: 139.7400, name: "Dirndl Tokyo", address: "Roppongi, Minato City, Tokyo, Japan" },
  # { lat: 35.6895, lng: 139.6917, name: "Kilt Japan", address: "Shinjuku City, Tokyo, Japan" },
  # { lat: 35.6762, lng: 139.6503, name: "Thobe Styles", address: "Shibuya City, Tokyo, Japan" },
  # { lat: 35.7100, lng: 139.8107, name: "Poncho & More", address: "Sumida City, Tokyo, Japan" },
  # { lat: 35.6581, lng: 139.7516, name: "Barong Tagalog Hub", address: "Minato City, Tokyo, Japan" },
  # { lat: 35.6528, lng: 139.8395, name: "Djellaba Wear", address: "Odaiba, Tokyo, Japan" },
  # { lat: 35.7074, lng: 139.7343, name: "Baju Melayu Tokyo", address: "Toshima City, Tokyo, Japan" },
  # { lat: 35.6721, lng: 139.8173, name: "Ao Dai Designs", address: "Koto City, Tokyo, Japan" },
  # { lat: 35.6433, lng: 139.6986, name: "Dashiki Street", address: "Meguro City, Tokyo, Japan" },
  # { lat: 35.7023, lng: 139.7755, name: "Sarong Fashion", address: "Taito City, Tokyo, Japan" },
  # { lat: 35.6552, lng: 139.7008, name: "Lehenga Couture", address: "Setagaya City, Tokyo, Japan" },
  # { lat: 35.6496, lng: 139.7033, name: "Gho & More", address: "Shibuya City, Tokyo, Japan" },
  # { lat: 35.6568, lng: 139.6990, name: "Le Wagon Tokyo", address: "2 Chome-11-3 Meguro, Meguro City, Tokyo 153-0063, Japan" },
  # { lat: 35.6568, lng: 139.6990, name: "Le Wagon Tokyo", address: "2 Chome-11-3 Meguro, Meguro City, Tokyo 153-0063, Japan" },
  # { lat: 35.6568, lng: 139.6990, name: "Le Wagon Tokyo", address: "2 Chome-11-3 Meguro, Meguro City, Tokyo 153-0063, Japan" },
  # { lat: 35.6568, lng: 139.6990, name: "Le Wagon Tokyo", address: "2 Chome-11-3 Meguro, Meguro City, Tokyo 153-0063, Japan" }

clothing_countries = ["Japan", "South Korea", "India", "China", "Germany", "Scotland", "Middle East", "Latin America", "Philippines", "Morocco", "Malaysia", "Vietnam", "West Africa", "Southeast Asia", "India", "Bhutan", "Central Asia", "Mexico", "Colombia", "Kenya"];

clothing_items.each_with_index do |item, index|
  clothing = Clothing.new(
    name: item,
    price: rand(1000...10_000).round(-1),
    size: ["S", "M", "L"].sample,
    description: clothing_descriptions[index],
    address: clothing_address[index],
    country: clothing_countries[index],
  )
  clothing.user = User.all.sample
  image_path = Rails.root.join("app/assets/images/#{item.downcase.gsub(' ', '_')}.png")
  if File.exist?(image_path)
    file = File.open(image_path)
    clothing.photo.attach(io: file, filename: "#{item.parameterize}.jpg", content_type: "image/jpeg")
  else
    puts ":warning: Image not found for #{item}, skipping attachment."
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
