class Appointment < ApplicationRecord
  belongs_to :pet
  has_many :applies
end
