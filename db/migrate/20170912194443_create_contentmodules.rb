class CreateContentmodules < ActiveRecord::Migration
  def change
    create_table :contentmodules do |t|
      t.text :modular_content
      t.belongs_to :slide, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
