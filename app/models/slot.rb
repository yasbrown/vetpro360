class Slot < ApplicationRecord
  has_many :appointments
  has_one :user, through: :appointment
  has_one :animal, through: :appointment

  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
