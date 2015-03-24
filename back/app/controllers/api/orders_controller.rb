module Api
	class OrdersController < ApplicationController
		def index
			@orders = Order.all
			render json: @orders
		end

		def show
			@orders = Customer.find_by(id: params[:id]).orders
			render json: @orders
		end
	end
end