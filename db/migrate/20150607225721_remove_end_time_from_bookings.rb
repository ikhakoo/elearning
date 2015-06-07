class RemoveEndTimeFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :end_time, :string
  end
end
