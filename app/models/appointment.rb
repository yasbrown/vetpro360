class Appointment < ApplicationRecord
  belongs_to :slot
  belongs_to :animal
  belongs_to :user

  validates :start_time, presence: true
  validates :end_time, presence: true
end
