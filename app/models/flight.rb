class Flight < ApplicationRecord
  belongs_to :departing_airport, class_name: "Airport"
  belongs_to :arriving_airport, class_name: "Airport"
  has_many :bookings
  has_many :passengers, through: :bookings

  def takeoff_string
    self.takeoff.strftime("%Y-%m-%d")
  end

  def self.takeoff_strings
    self.order(:takeoff).map(&:takeoff_string).uniq
  end

  def self.search(params)
    return [] if params.empty?
    self.where("departing_airport_id = :departing_airport_id AND arriving_airport_id = :arriving_airport_id AND DATE(takeoff) = :takeoff", params.to_h)
  end
end
