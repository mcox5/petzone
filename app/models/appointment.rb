class Appointment < ApplicationRecord
  belongs_to :pet
  has_one :meeting, dependent: :destroy
end
