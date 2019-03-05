class Order < ApplicationRecord
  belongs_to :user
  has_many :order_contents
  has_many :items, through: :order_contents
end
