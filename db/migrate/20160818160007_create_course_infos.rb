class CreateCourseInfos < ActiveRecord::Migration
  def change
    create_table :course_infos do |t|
      t.text :description

      t.timestamps null: false
    end
  end
end
