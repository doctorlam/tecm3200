class RemoveCriteriaFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :criteria, :string
  end
end
