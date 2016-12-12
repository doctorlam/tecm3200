class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :code
      t.string :semester

      t.timestamps null: false
    end
  end
end
