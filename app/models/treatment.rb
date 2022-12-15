class Treatment < ApplicationRecord
  belongs_to :pet
  has_many :meetings, dependent: :destroy
end
