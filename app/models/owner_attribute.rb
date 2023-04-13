class OwnerAttribute < ApplicationRecord
  belongs_to :user

  has_many :animals, dependent: :destroy
  has_many :medications, through: :animals, dependent: :destroy
  has_many :appointments, through: :animals, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
end
