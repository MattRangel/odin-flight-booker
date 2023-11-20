class AddRefsToBooking < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :flight, null: false
  end
end
