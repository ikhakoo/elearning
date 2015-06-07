class RemoveStartTimeFromSchedules < ActiveRecord::Migration
  def change
    remove_column :schedules, :start_time, :string
  end
end
