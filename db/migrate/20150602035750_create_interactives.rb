class CreateInteractives < ActiveRecord::Migration
  def change
    create_table :interactives do |t|
      t.string :url
      t.string :password
      t.boolean :is_private
      t.text :about

      t.timestamps null: false
    end
  end
end
