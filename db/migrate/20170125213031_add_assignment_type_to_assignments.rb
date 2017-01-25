class AddAssignmentTypeToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :assignment_type, :string
  end
end
