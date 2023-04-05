class VetAttribute < ApplicationRecord
  belongs_to :user
  has_many :medications
  has_many :appointments
  has_many :animals, through: :medications
  has_many :animals, through: :appointments
  validates :name, presence: true
end
