class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.integer :lesson_id
      t.text :content

      t.timestamps null: false
    end
  end
end
