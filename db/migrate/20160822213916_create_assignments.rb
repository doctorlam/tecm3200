class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.text :name
      t.text :description
      t.date :deadline

      t.timestamps null: false
    end
  end
end
