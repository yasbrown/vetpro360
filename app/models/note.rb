class Note < ApplicationRecord
  belongs_to :animal
  belongs_to :vet_attribute

  def created_today?
    created_at.to_date == Date.today
  end
end
