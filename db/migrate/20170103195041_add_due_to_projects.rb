class AddDueToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :due, :date
  end
end
