class Appointment < ApplicationRecord
  belongs_to :pet
  has_many :applies
  has_many :users, through: :pets
end
