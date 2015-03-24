require 'rails_helper'

RSpec.describe Api::OrdersController, type: :controller do
	context 'Index' do
		it 'responds with 200' do
			get :index

			expect(response).to have_http_status(200)
		end

		it 'render json' do
			orders = FactoryGirl.create_list(:order, 3)
			get :index
			parsed = JSON.parse(response.body)
			
			expect(parsed[0]['product']).to eq('Simple Thing')
		end
	end
end