class User < ApplicationRecord
  has_many :animals
  has_many :medications
  has_many :appointments
  has_many :slots, through: :appointment
  has_many :medications, through: :animal

  validates :email, presence: true
  validates :password, presence: true
  validates :name, presence: true

end
