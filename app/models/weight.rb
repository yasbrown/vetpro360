class Weight < ApplicationRecord
  belongs_to :animal

  validates :weight, presence: true
  validates :date_weight_updated, presence: true
  validates :weight, numericality: { only_float: true }

end
