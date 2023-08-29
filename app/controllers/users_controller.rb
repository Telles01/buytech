class UsersController < ApplicationController
  validates :name, presence: true, length: { minimum: 2 }
  validates :suname, presence: true, length: { minimum: 2}
  validates :address, presence: true
  validates :city, presence: true
  validates :phone_number, lenght: { is: 11 }
  validates :phone_number, presence: true, uniqueness: true
end
