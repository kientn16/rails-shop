# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#seed
Product.create(name: "Ipanema", description: "The beach of Ipanema is known for its elegant development and its social life.", avatar: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/beach02.jpg", category_id: 1, status: 1,price: 100000)
Product.create(name: "7 Mile Beach", description: "The western coastline contains the island's finest beaches.", avatar: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/beach03.jpg", category_id: 1, status: 1,price: 150000)
Product.create(name: "El Castillo", description: "An elite destination famous for its white sand beaches", avatar: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/beach04.jpg", category_id: 1, status: 1,price: 240000)
Product.create(name: "Machu Picchu", description: "Machu Picchu was built around 1450, at the height of the Inca Empire.", avatar: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/history02.jpg", category_id: 2, status: 1,price: 430000)
Product.create(name: "Dunrobin Castle", description: "Dunrobin Castle is a stately home in Sutherland. Its origins lie in the Middle Ages.", avatar: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/history03.jpg", category_id: 2, status: 1,price: 420000)
Product.create(name: "Palace of Westminster", description: "The meeting place of the two houses of the Parliament of the United Kingdom", avatar: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/history04.jpg", category_id: 3, status: 1,price: 210000)
Product.create(name: "Dolomites", description: "The Dolomites are a mountain range located in northeastern Italy famous for skiing in the winter months.", avatar: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/skiing02.jpg", category_id: 3, status: 1,price: 340000)
Product.create(name: "Chamonix", description: "It was the site of the first Winter Olympics in 1924", avatar: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/skiing03.jpg", category_id: 3, status: 1,price: 1320000)
Product.create(name: "Vail", description: "The second largest single mountain ski resort in the United States", avatar: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/skiing04.jpg", category_id: 3, status: 1,price: 210000)
Product.create(name: "Ipanema", description: "The beach of Ipanema is known for its elegant development and its social life.", avatar: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/beach02.jpg", category_id: 1, status: 1,price: 100000)
Product.create(name: "7 Mile Beach", description: "The western coastline contains the island's finest beaches.", avatar: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/beach03.jpg", category_id: 1, status: 1,price: 150000)
Product.create(name: "El Castillo", description: "An elite destination famous for its white sand beaches", avatar: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/beach04.jpg", category_id: 1, status: 1,price: 240000)
Product.create(name: "Machu Picchu", description: "Machu Picchu was built around 1450, at the height of the Inca Empire.", avatar: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/history02.jpg", category_id: 2, status: 1,price: 430000)
Product.create(name: "Dunrobin Castle", description: "Dunrobin Castle is a stately home in Sutherland. Its origins lie in the Middle Ages.", avatar: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/history03.jpg", category_id: 2, status: 1,price: 420000)

Category.create(name: 'Quan',status: 1)
Category.create(name: 'Ao',status: 1)
Category.create(name: 'Quan Nam',status: 1)

User.create(name: 'Super Admin', email: 'admin@gmail.com', password: '123456', role: 1, status: 1)

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"