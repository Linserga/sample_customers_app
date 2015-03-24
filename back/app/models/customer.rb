class Customer < ActiveRecord::Base
	has_many :orders, dependent: :destroy

	validates :name, presence: true
	validates :city, presence: true	

	def total_orders
		Order.where(customer_id: self.id).sum('price')
	end

	def as_json(options={})
  super.as_json(options).merge({totalOrders: total_orders })
end
end
