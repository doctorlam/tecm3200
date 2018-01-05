class CreateBulletedLists < ActiveRecord::Migration
  def change
    create_table :bulleted_lists do |t|
      t.text :list
      t.belongs_to :slide, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
