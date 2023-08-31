class Product < ApplicationRecord
  belongs_to :owner, class_name: "User"

  validates :name, presence: true
  validates :description, presence: true
  # validates :image, presence: true
  validates :units, presence: true
  validates :price, numericality: { greater_than: 0 }

  include PgSearch::Model
  pg_search_scope :search_products,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
  }
end
