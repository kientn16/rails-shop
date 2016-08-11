# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#seed
require 'csv'
Product.delete_all
Category.delete_all
User.delete_all
OrderStatus.delete_all
csv_product_text = File.read(Rails.root.join('lib', 'seeds', 'seed-products.csv'))
csv_product = CSV.parse(csv_product_text, :headers => true, :encoding => 'ISO-8859-1')
csv_product.each do |row|
  t = Product.new
  t.name = row['name']
  t.description = row['description']
  t.avatar = row['avatar']
  t.category_id = row['category_id']
  t.status = row['status']
  t.price = row['price']
  t.save
end

puts "There are now #{Product.count} rows in the transactions table"

csv_category_text = File.read(Rails.root.join('lib', 'seeds', 'seed-categories.csv'))
csv_category = CSV.parse(csv_category_text, :headers => true, :encoding => 'ISO-8859-1')
csv_category.each do |row|
  t = Category.new
  t.name = row['name']
  t.status = row['status']
  t.save
end

puts "There are now #{Category.count} rows in the transactions table"

csv_user_text = File.read(Rails.root.join('lib', 'seeds', 'seed-users.csv'))
csv_user = CSV.parse(csv_user_text, :headers => true, :encoding => 'ISO-8859-1')
csv_user.each do |row|
  t = User.new
  t.name = row['name']
  t.email = row['email']
  t.password = row['password']
  t.status = row['status']
  t.role = row['role']
  t.save
end

puts "There are now #{User.count} rows in the transactions table"

csv_order_status_text = File.read(Rails.root.join('lib', 'seeds', 'seed-order-status.csv'))
csv_order_status = CSV.parse(csv_order_status_text, :headers => true, :encoding => 'ISO-8859-1')
csv_order_status.each do |row|
  t = OrderStatus.new
  t.name = row['name']
  t.save
end

puts "There are now #{OrderStatus.count} rows in the transactions table"