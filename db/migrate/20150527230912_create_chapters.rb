class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :title
      t.text :content
      t.integer :lesson_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
