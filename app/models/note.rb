class Note < ApplicationRecord
  belongs_to :animal
  belongs_to :vet_attribute
end
