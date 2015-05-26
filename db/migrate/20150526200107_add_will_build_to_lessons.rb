class AddWillBuildToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :will_build, :string
  end
end
