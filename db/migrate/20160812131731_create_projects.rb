class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :criteria
      t.string :deliverables
      t.string :related

      t.timestamps null: false
    end
  end
end
