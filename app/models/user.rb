class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :products, dependent: :destroy, foreign_key: 'owner_id', class_name: 'Product'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
