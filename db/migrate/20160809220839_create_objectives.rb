class CreateObjectives < ActiveRecord::Migration
  def change
    create_table :objectives do |t|
      t.integer :lesson_id
      t.text :content

      t.timestamps null: false
    end
  end
end
