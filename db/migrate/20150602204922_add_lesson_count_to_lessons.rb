class AddLessonCountToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :lesson_count, :integer
  end
end
