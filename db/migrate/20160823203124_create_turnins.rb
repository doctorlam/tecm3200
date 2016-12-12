class CreateTurnins < ActiveRecord::Migration
  def change
    create_table :turnins do |t|
      t.integer :homework_id
      t.integer :assignment_id

      t.timestamps null: false
    end
  end
end
