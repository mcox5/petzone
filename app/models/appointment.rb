class Appointment < ApplicationRecord
  belongs_to :pet
  has_many :applies, dependent: :destroy
  has_many :users, through: :pets
end
