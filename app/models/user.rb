class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :animals, dependent: :destroy
  has_many :medications, through: :animals, dependent: :destroy
  has_many :appointments, through: :animals, dependent: :destroy

  validates :email, presence: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

end
