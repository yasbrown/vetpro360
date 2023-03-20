class Animal < ApplicationRecord
  belongs_to :user

  has_many :medications
  has_many :appointments
  has_many :slots, through: :appointment

  validates :name, presence: true
  validates :species, presence: true
  validates :gender, presence: true
  validates :weight, numericality: { only_integer: true }
end
