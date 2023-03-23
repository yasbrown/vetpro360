require "json"
require "open-uri"

class Animal < ApplicationRecord
  belongs_to :user

  has_many :medications, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :slots, through: :appointments

  validates :name, presence: true
  validates :species, presence: true
  validates :gender, presence: true
  validates :weight, numericality: { only_integer: true }

  SPECIES = ["Dog", "Cat"]
  GENDER = ["Male", "Female", "Male neutered", "Female neutered"]

  dog_breed_list = []
  dog_url = "https://api.thedogapi.com/v1/breeds"
  dog_breeds_array = JSON.parse(URI.open(dog_url).read)

  dog_breeds_array.map do |dog_breed|
    dog_breed_list << dog_breed["name"]
  end

  cat_breed_list = []
  cat_url = "https://api.thecatapi.com/v1/breeds"
  cat_breeds_array = JSON.parse(URI.open(cat_url).read)

  cat_breeds_array.map do |cat_breed|
    cat_breed_list << cat_breed["name"]
  end

  DOG_BREEDS = dog_breed_list
  CAT_BREEDS = cat_breed_list

  def is_neutered?
    gender.include?"neutered"
  end
end
