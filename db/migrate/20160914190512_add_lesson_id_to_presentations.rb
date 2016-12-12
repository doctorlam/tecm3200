class AddLessonIdToPresentations < ActiveRecord::Migration
  def change
    add_column :presentations, :lesson_id, :integer
  end
end
