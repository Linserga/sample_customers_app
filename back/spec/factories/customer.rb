FactoryGirl.define do
	factory :customer do
		name 'Serge'
		city 'Kiev'

		after(:create) do |customer, evaluator|
			create_list(:order, 3, customer: customer)
		end
	end

	factory :order do
		product "Simple Thing"
		price 15

		customer
	end
end