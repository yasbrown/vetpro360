class User < ApplicationRecord
  has_many :animals, dependent: :destroy
  has_many :medications, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :slots, through: :appointments

  validates :email, presence: true
  validates :password, presence: true
  validates :name, presence: true

end
