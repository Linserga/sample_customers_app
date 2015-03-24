require 'rails_helper'

RSpec.describe Customer, type: :model do
	let(:customer) { FactoryGirl.create(:customer) }

	subject { customer }

	it { should be_valid }

	it 'should compte all his orders' do
		expect(customer.total_orders).to eq(15 * 3)
	end

	it 'should not be valid without name' do
		customer.name = ""
		expect(customer).not_to be_valid
	end

	context 'it should not be valid without city' do
		before { customer.city = '' }

		it { should_not be_valid }
	end

	# context 'it should delete all orders after deleting customer' do
	# 	before do
	# 		customer.destroy
	# 	end

	# 	its(:orders) { should be_empty }
	# end

	it 'should delete all orders after deleting customer' do
		customer.destroy
		expect(customer.orders).to be_empty
	end
end
