class Apply < ApplicationRecord
  belongs_to :vaccine
  belongs_to :deworming
  belongs_to :exam
  belongs_to :appointment
end
