class BookingsController < ApplicationController
  def new
    @flight = Flight.find(booking_params[:flight_id])
    @booking = @flight.bookings.new
    booking_params[:passenger_count].to_i.times { @booking.passengers.new }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id, :passenger_count, passengers_attributes: [:name, :email])
  end
end
