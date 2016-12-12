class CreateGradecategories < ActiveRecord::Migration
  def change
    create_table :gradecategories do |t|
      t.text :description
      t.integer :grade_id

      t.timestamps null: false
    end
  end
end
