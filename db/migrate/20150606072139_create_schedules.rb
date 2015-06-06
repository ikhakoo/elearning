class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :user_id
      t.integer :start_time
      t.integer :end_time
      t.date :date

      t.timestamps null: false
    end
  end
end
