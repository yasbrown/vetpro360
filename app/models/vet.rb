class Vet < ApplicationRecord
  has_many :medications
  has_many :appointments
  has_many :animals, through: :medications
  validates :name, presence: true
end
