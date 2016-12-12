class CreateDeliverables < ActiveRecord::Migration
  def change
    create_table :deliverables do |t|
      t.text :description

      t.timestamps null: false
    end
  end
end
