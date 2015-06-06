class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :start_time
      t.integer :end_time
      t.date :date
      t.integer :user_id
      t.integer :instructor_id

      t.timestamps null: false
    end
  end
end
