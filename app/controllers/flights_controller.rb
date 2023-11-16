class FlightsController < ApplicationController
  def index
    @flights = Flight.search(flight_search_params)
  end

  private
  def flight_search_params
    params.permit(:departing_airport_id, :arriving_airport_id, :takeoff, :passenger_count)
  end
end
