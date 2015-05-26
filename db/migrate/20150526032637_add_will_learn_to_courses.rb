class AddWillLearnToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :will_learn, :string
  end
end
