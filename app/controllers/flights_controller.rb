class FlightsController < ApplicationController
  def index
    @flights = []
    @airport_options = Airport.all.pluck(:text_code, :id)
  end
end
