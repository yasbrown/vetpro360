class Appointment < ApplicationRecord
  belongs_to :slot
  belongs_to :animal
  belongs_to :vet_attribute

  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :no_past_appointment

  def no_past_appointment
    if Date.today > start_time.to_date || Time.now > start_time.to_time
      errors.add(:start_time, "cannot be in the past")
    elsif Date.today > end_time.to_date || Time.now > end_time.to_time
      errors.add(:end_time, "cannot be in the past")
    end
  end
end
