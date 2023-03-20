class Animal < ApplicationRecord
  belongs_to :user

  has_many :medications, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :slots, through: :appointments

  validates :name, presence: true
  validates :species, presence: true
  validates :gender, presence: true
  validates :weight, numericality: { only_integer: true }
end
