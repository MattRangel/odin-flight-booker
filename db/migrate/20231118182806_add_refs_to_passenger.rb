class AddRefsToPassenger < ActiveRecord::Migration[7.0]
  def change
    add_reference :passengers, :booking, null: false
  end
end
