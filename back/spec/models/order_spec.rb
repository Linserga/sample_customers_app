require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { FactoryGirl.create(:order)}

  subject {order}

  it { should be_valid }

  it 'should not be valid without customer_id' do
  	order.customer_id = nil
  	expect(order).not_to be_valid
  end

  context 'it should not be valid without product' do
  	before { order.product = ''}

  	it { should_not be_valid }
  end

  context 'it should not be valid without price' do
  	before { order.price = nil }

  	it { should_not be_valid }
  end
end
