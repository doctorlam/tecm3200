class AddProjectIdToRelated < ActiveRecord::Migration
  def change
    add_column :relateds, :project_id, :integer
  end
end
