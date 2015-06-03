class AddChapterCountToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :chapter_count, :integer
  end
end
