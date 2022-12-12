class Exam < ApplicationRecord
  has_many_attached :photos
  belongs_to :pet
end
