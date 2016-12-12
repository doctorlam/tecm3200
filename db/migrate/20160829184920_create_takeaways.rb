class CreateTakeaways < ActiveRecord::Migration
  def change
    create_table :takeaways do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
