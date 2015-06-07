class RemoveEndTimeFromSchedules < ActiveRecord::Migration
  def change
    remove_column :schedules, :end_time, :string
  end
end
