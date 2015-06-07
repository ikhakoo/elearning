class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :time
      t.date :date
      t.integer :user_id
      t.integer :schedule_id

      t.timestamps null: false
    end
  end
end
