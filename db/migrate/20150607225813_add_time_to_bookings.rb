class AddTimeToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :time, :integer
  end
end
