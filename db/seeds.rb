# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# require 'ffaker'

# user = User.create(email: 'loveson821@gmail.com', password: '123123123')

# 10.times do
#   User.create(email: Faker::Internet.email, password: '123123123')
# end

# 100.times do
#   Shop.create(name: Faker::Company.name, phone: Faker::PhoneNumber.phone_number, address: Faker::Address.street_address, user_id: user.id)
# end

shop = Shop.find(1)

# records = Dir.glob( Rails.root.to_s + '/public/uploads/product/image/**/*.png' )
# records.reject! { |i|
#   filename = File.basename i
#   filename.start_with?('thumb') === true
# }

# puts records.sample

50.times do |i|
  puts i
  Product.create!(name: Faker::Name.name, price: Faker::Commerce.price, remote_image_url: Faker::Avatar.image, shop_id: shop.id)
end