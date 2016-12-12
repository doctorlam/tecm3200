class RemoveRubricFromProject < ActiveRecord::Migration
  def change
    remove_column :projects, :rubric, :text
  end
end
