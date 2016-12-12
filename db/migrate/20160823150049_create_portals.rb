class CreatePortals < ActiveRecord::Migration
  def change
    create_table :portals do |t|
      t.integer :submission_id
      t.integer :assignment_id

      t.timestamps null: false
    end
  end
end
