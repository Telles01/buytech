class Order < ApplicationRecord
  belongs_to :buyer, class_name: "User"
  belongs_to :product
  validates :buyer, presence: true
  validates :product, presence: true
end
