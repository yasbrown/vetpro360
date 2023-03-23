class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :animals, :medications, :appointments, dependent: :destroy
  has_many :slots, through: :appointments

  validates :email, :password, :first_name, :last_name, presence: true
  validates :email, uniqueness: true

end
