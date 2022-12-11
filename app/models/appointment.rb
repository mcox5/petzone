class Appointment < ApplicationRecord
  belongs_to :pet
  has_many :applies, dependent: :destroy
  accepts_nested_attributes_for :applies
end
