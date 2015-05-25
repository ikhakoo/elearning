class AddColumnToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :lesson_order, :integer
  end
end
