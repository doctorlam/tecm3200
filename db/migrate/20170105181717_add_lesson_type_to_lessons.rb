class AddLessonTypeToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :lesson_type, :string
  end
end
