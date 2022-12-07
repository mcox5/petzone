class Exam < ApplicationRecord
  has_many_attached :photos
  has_many :applies
end
