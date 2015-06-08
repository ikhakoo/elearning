class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :attachment

      t.timestamps null: false
    end
  end
end
