class PassengerMailer < ApplicationMailer
  def ticket_booked_email
    @passenger = params[:passenger]
    @booking= params[:booking]
    @flight = @booking.flight
    mail(to: @passenger.email, subject: "Booking for flight ##{@flight.id}")
  end
end
