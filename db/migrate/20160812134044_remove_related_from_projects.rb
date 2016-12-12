class RemoveRelatedFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :related, :string
  end
end
