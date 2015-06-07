class AddTimeToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :time, :integer
  end
end
