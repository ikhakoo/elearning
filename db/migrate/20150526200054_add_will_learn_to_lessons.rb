class AddWillLearnToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :will_learn, :string
  end
end
