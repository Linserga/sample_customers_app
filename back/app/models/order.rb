class Order < ActiveRecord::Base
  belongs_to :customer

  validates :product, presence: true
  validates :customer_id, presence: true
  validates :price, presence: true
end
