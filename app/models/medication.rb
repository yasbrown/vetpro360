class Medication < ApplicationRecord
  belongs_to :animal
  belongs_to :user

  validates :quantity_dispensed, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :quantity_dispensed, numericality: { only_integer: true }
  validates :frequency_to_give_per_day, numericality: { only_integer: true }
end
