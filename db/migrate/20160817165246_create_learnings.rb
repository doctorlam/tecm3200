class CreateLearnings < ActiveRecord::Migration
  def change
    create_table :learnings do |t|
      t.integer :lesson_id
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
