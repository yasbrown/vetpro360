require "json"
require "open-uri"
require "csv"

class Medication < ApplicationRecord
  belongs_to :animal
  belongs_to :vet_attribute
  validates :quantity_dispensed, presence: true,
                                  numericality: { only_integer: true }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :quantity_dispensed, numericality: { only_integer: true }

  medication_list = []
  csv_filepath = "db/medication_list.csv"

  for num in (1..197)
    medication_url = "https://dailymed.nlm.nih.gov/dailymed/services/v2/drugnames.json?page=#{num}&pagesize=100"
    medication_hash = JSON.parse(URI.open(medication_url).read)
    medication_array = medication_hash['data']

    medication_array.map do |medication|
      medication_list << medication['drug_name']
    end
  end

  CSV.open(csv_filepath, "wb") do |csv|
    csv << ["Medication Name"]

    medication_list.each do |meds|
      csv << [meds]
    end
  end

  CSV.foreach(csv_filepath, headers: :first_row) do |row|
    medication_list << row['Medication Name']
  end

  MEDICATIONS = medication_list
end
