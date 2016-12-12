class CreateRelateds < ActiveRecord::Migration
  def change
    create_table :relateds do |t|
      t.text :description

      t.timestamps null: false
    end
  end
end
