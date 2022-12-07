class Pet < ApplicationRecord
  belongs_to :user
  has_many :treatments, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :applies, through: :appointments
  has_many :vaccines, through: :applies
  has_many :exams, through: :applies
  has_many :dewormings, through: :applies
  has_many_attached :photos
end
