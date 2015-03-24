require 'rails_helper'

RSpec.describe Api::CustomersController, type: :controller do

	context 'Index action' do
		it 'responds with 200 status' do
			get :index
			expect(response).to have_http_status(200)
		end

		it 'responds with json' do
			customer = FactoryGirl.create(:customer)
		 	get :index
		 	parsed = JSON.parse(response.body)
		 	expect(parsed[0]['name']).to eq('Serge')		 	
		end
	end

	context 'Show Action' do
		
		it 'responds with 200 status' do
			customer = FactoryGirl.create(:customer)
			get :show, id: customer.id

			expect(response).to have_http_status(200)
		end

		it 'renders json' do
			customer = FactoryGirl.create(:customer)
			orders = customer.orders

			get :show, id: customer.id
			parsed = JSON.parse(response.body)
			expect(parsed['name']).to eq(customer.name)
		end	
	end

	context 'Destroy Action' do
		it 'destroys customer' do
			customer = FactoryGirl.create(:customer)
			expect {
				delete :destroy, id: customer.id
			}.to change(Customer, :count).by(-1)
		end
	end

	context 'Create Action' do
		it 'creates customer' do
			expect {
				post :create, customer: { name: 'Alex', city: 'Kiev' }
			}.to change(Customer, :count).by(1)
		end
	end

	context 'Update Action' do
		let(:customer) {FactoryGirl.create(:customer)}	
		before {		
			put :update, id: customer.id, customer: { name: 'Misha' }
			customer.reload
		}

		it { expect(customer.name).to eq('Misha')}
	end
end