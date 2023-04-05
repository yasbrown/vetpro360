class Medication < ApplicationRecord
  belongs_to :animal
  belongs_to :vet_attribute
  validates :quantity_dispensed, presence: true,
                                  numericality: { only_integer: true }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :quantity_dispensed, numericality: { only_integer: true }
end
