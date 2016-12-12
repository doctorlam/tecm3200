class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.decimal :week
      t.date :date

      t.timestamps null: false
    end
  end
end
