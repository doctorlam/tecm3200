class AddRubricToProject < ActiveRecord::Migration
  def change
    add_column :projects, :rubric, :text
  end
end
