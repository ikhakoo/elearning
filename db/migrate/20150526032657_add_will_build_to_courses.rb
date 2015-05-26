class AddWillBuildToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :will_build, :string
  end
end
