module Api
	class CustomersController < ApplicationController
		def index
			@customers = Customer.all
			render json: @customers
		end		

		def show
			@customer = Customer.find_by(id: params[:id])
			render json: @customer
		end

		def create
			@customer = Customer.new(customer_params)
			if @customer.save
				render json: {}
			else
				render json: {}, status: :unprocessable_entity
			end
		end

		def update
			@customer = Customer.find_by(id: params[:id])

			if @customer.update_attributes(customer_params)
				render json: {}
			else
				render json: {}, status: :un
			end
		end

		def destroy
			@customer = Customer.find_by(id: params[:id])
			@customer.destroy
			render json: {}			
		end

		private

			def customer_params
				params.require(:customer).permit(:name, :city)
			end
	end
end