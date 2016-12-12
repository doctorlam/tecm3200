class AddLessonIdToTakeaways < ActiveRecord::Migration
  def change
    add_column :takeaways, :lesson_id, :integer
  end
end
