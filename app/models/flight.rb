class Flight < ApplicationRecord
  belongs_to :departing_airport, class_name: "Airport"
  belongs_to :arriving_airport, class_name: "Airport"

  def takeoff_string
    self.takeoff.strftime("%Y-%m-%d")
  end

  def self.takeoff_strings
    self.order(:takeoff).map(&:takeoff_string).uniq
  end
end
