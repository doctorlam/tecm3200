class CreateSlidedecks < ActiveRecord::Migration
  def change
    create_table :slidedecks do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
