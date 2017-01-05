class AddLessonIdToTutorials < ActiveRecord::Migration
  def change
    add_column :tutorials, :lesson_id, :integer
  end
end
