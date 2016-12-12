class AddProjectIdToCriteria < ActiveRecord::Migration
  def change
    add_column :criteria, :project_id, :integer
  end
end
