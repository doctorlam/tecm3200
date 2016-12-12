class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.text :name
      t.integer :submission_id

      t.timestamps null: false
    end
  end
end
