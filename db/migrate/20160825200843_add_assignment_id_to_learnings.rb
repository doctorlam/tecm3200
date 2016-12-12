class AddAssignmentIdToLearnings < ActiveRecord::Migration
  def change
    add_column :learnings, :assignment_id, :integer
  end
end
