class ChangeFlightDurationSecondsToMinutes < ActiveRecord::Migration[7.0]
  change_table :flights do |t|
    t.rename :duration_seconds, :duration_minutes
  end
end
