class Product < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true
  # validates :image, presence: true
  validates :units, presence: true
  validates :price, numericality: { greater_than: 0 }
end
