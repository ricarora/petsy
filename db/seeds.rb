# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..10).each do
  user = {
    name: Faker::Name.name,
    email: Faker::Internet.email,
    username: Faker::Internet.user_name,
    password: Faker::Internet.password(10, 20),
    storename: Faker::Company.name + "Store",
    image_url: Faker::Avatar.image,
  }

  User.create(user)
end

(1..100).each do
  product = {
    name: Faker::Name.name,
    description: Faker::Lorem.paragraph, #http://lorempixel.com/400/200/animals/Dummy-Text/
    price: Faker::Commerce.price,
    image_url: Faker::Avatar.image,
    vendor_id: Faker::Number.digit
  }

  Product.create(product)
end

(1..10).each do
  category = {
    name: Faker::Commerce.department
  }

  Category.create(category)
end

(1..50).each do
  review = {
    title: Faker::Company.catch_phrase,
    comment: Faker::Lorem.sentence,
    rating: rand(1..5),
    author: Faker::Name.name,
    product_id: rand(1..100)
  }

  Review.create(review)
end

(1..25).each do
  product_category = {
    product_id: rand(1..100),
    category_id: rand(1..10)
  }

  Productcategory.create(product_category)
end

(1..10).each do
  order = {
    status: ['paid', 'shipped', 'pending'][rand(2)],
    name_on_card: Faker::Name.name,
    card_number: Faker::Business.credit_card_number,
    card_exp: Faker::Business.credit_card_expiry_date,
    security_code: Faker::Number.number(3),
    zip: Faker::Address.zip_code,
    email: Faker::Internet.email,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state
  }

  Order.create(order)
end

(1..70).each do
  orderitem = {
    qty: rand(1..10),
    totalprice: Faker::Commerce.price,
    product_id: rand(1..100),
    order_id: rand(1..10),
    # cart_id: rand(1..25),
  }

  Orderitem.create(orderitem)
end
