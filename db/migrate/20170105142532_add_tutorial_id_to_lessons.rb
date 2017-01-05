class AddTutorialIdToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :tutorial_id, :integer
  end
end
