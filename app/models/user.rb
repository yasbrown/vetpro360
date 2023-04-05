class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :vet_attributes, dependent: :destroy
  has_many :owner_attributes, dependent: :destroy

  validates :email, presence: true,
                    uniqueness: { message: "Email already exists"}
  validates :password, presence: true,
                        length: { minimum: 8 }
end
