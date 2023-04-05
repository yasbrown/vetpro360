class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates_presence_of :email, allow_blank: true
  validates_presence_of :password, allow_blank: true

  validates :email, uniqueness: { message: "Email already exists"}
  # validates :password, length: { minimum: 8 }
end
