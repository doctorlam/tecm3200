class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.text :name
      t.text :description
      t.text :materials
      t.text :vital

      t.timestamps null: false
    end
  end
end
