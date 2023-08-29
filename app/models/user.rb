class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :products, dependent: :destroy, foreign_key: 'owner_id', class_name: 'Product'

  validates :name, presence: true, length: { minimum: 2 }
  validates :surname, presence: true, length: { minimum: 2 }
  validates :address, presence: true
  validates :city, presence: true
  validates :phone_number, length: { is: 11 }
  validates :phone_number, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
