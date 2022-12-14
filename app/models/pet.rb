class Pet < ApplicationRecord
  belongs_to :user
  has_many :treatments, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :vaccines, dependent: :destroy
  has_many :exams, dependent: :destroy
  has_many :dewormings, dependent: :destroy
  has_many :meetings
  has_many_attached :photos
  include PgSearch::Model
  pg_search_scope :pets_search,
  against: %i[ name breed birthday gender weight spayed allergies color chiped specie ],
  using: {
    tsearch: { prefix: true }
  }
end
