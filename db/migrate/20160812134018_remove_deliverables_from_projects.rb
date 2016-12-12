class RemoveDeliverablesFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :deliverables, :string
  end
end
