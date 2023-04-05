class VetAttribute < ApplicationRecord
  belongs_to :user
  has_many :medications, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :animals, through: :medications
  has_many :animals, through: :appointments
  validates :name, presence: true
end
