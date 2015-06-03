class CreateJoinTableUserChapter < ActiveRecord::Migration
  def change
    create_join_table :users, :chapters do |t|
      # t.index [:user_id, :chapter_id]
      # t.index [:chapter_id, :user_id]
    end
  end
end
