class RemoveStartTimeFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :start_time, :string
  end
end
