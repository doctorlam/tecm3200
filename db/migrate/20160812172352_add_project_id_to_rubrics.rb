class AddProjectIdToRubrics < ActiveRecord::Migration
  def change
    add_column :rubrics, :project_id, :text
  end
end
