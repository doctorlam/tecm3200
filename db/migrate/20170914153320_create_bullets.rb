class CreateBullets < ActiveRecord::Migration
  def change
    create_table :bullets do |t|
      t.text :list_item
      t.belongs_to :bulleted_list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
