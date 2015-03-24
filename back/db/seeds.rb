# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
	Customer.create!(
		name: Faker::Name.name,
		city: Faker::Address.city
		)
end

customers = Customer.all

customers.each do |customer|
	3.times do
		customer.orders.create!(
				product: Faker::Commerce.product_name,
				price: Faker::Commerce.price
			)
	end
end

puts "***DONE***"